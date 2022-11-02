import Foundation
import Capacitor
import MobileCoreServices
import YPImagePicker

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ImagePickerPlugin)
public class ImagePickerPlugin: CAPPlugin {
    private var imageCounter = 0

    @objc func present(_ call: CAPPluginCall) {
        let limit = call.getInt("limit") ?? 1
        let surpassLimitMessage = call.getString("surpassLimitMessage", "You can only select %d images.")
        let libraryTitleText = call.getString("libraryTitleText", "Library")
        let albumsTitleText = call.getString("albumsTitleText", "Albums")
        let cancelText = call.getString("cancelText", "Cancel")
        let doneText = call.getString("doneText", "Done")

        var config = YPImagePickerConfiguration()

        config.showsPhotoFilters = false
        config.onlySquareImagesFromCamera = false
        config.screens = [.library]
        config.library.minNumberOfItems = 1
        config.library.maxNumberOfItems = limit
        config.library.defaultMultipleSelection = limit > 1
        config.hidesMultipleSelectionButton = true
        config.library.preSelectItemOnMultipleSelection = false
        config.library.skipSelectionsGallery = true
        config.wordings.warningMaxItemsLimit = surpassLimitMessage
        config.wordings.libraryTitle = libraryTitleText
        config.wordings.albumsTitle = albumsTitleText
        config.wordings.cancel = cancelText
        config.wordings.next = doneText

        DispatchQueue.main.async {
            let picker = YPImagePicker(configuration: config)

            picker.didFinishPicking { items, cancelled in
                if cancelled {
                    CAPLog.print("User Cancelled")
                } else if items.count > 0 {
                    self.handleResult(items, call)
                }

                picker.dismiss(animated: true, completion: nil)
            }

            self.bridge?.viewController?.present(picker, animated: true, completion: nil)
        }
    }

    private func handleResult(_ items: [YPMediaItem], _ call: CAPPluginCall) {
        var images = JSArray()

        for item in items {
            switch item {
            case .photo(let photo):
                if let data = photo.image.jpegData(compressionQuality: 1),
                   let fileURL = try? self.saveTemporaryImage(data),
                   let webURL = bridge?.portablePath(fromLocalURL: fileURL) {
                    var image = JSObject()
                    image["path"] = fileURL.absoluteString
                    image["webPath"] = webURL.absoluteString
                    image["mimeType"] = self.getMimeTypeFromURL(fileURL)
                    images.append(image)
                }

                break
            default:
                break
            }
        }

        var result = JSObject()
        result["images"] = images
        call.resolve(result)
    }

    /**
     * Credits: https://github.com/ionic-team/capacitor-plugins/blob/%40capacitor/camera%404.1.2/camera/ios/Plugin/CameraPlugin.swift#L518-L527
     */
    private func saveTemporaryImage(_ data: Data) throws -> URL {
        var url: URL
        repeat {
            imageCounter += 1
            url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("image-picker-\(imageCounter).jpg")
        } while FileManager.default.fileExists(atPath: url.path)

        try data.write(to: url, options: .atomic)

        return url
    }

    /**
     * Credits: https://github.com/capawesome-team/capacitor-file-picker/blob/v0.5.1/ios/Plugin/FilePicker.swift#L37-L46
     */
    private func getMimeTypeFromURL(_ url: URL) -> String {
        let fileExtension = url.pathExtension as CFString
        guard let extUTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension, nil)?.takeUnretainedValue() else {
            return ""
        }
        guard let mimeUTI = UTTypeCopyPreferredTagWithClass(extUTI, kUTTagClassMIMEType) else {
            return ""
        }
        return mimeUTI.takeRetainedValue() as String
    }
}
