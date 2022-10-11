import Foundation
import Capacitor
import YPImagePicker

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ImagePickerPlugin)
public class ImagePickerPlugin: CAPPlugin {
    private var imageCounter = 0

    @objc func present(_ call: CAPPluginCall) {
        var config = YPImagePickerConfiguration()

        config.showsPhotoFilters = false
        config.onlySquareImagesFromCamera = false
        config.screens = [.library]
        config.library.minNumberOfItems = 1
        config.library.maxNumberOfItems = 1

        DispatchQueue.main.async {
            let picker = YPImagePicker(configuration: config)

            picker.didFinishPicking { items, cancelled in
                if cancelled {
                    CAPLog.print("User Cancelled")
                } else if let photo = items.singlePhoto?.image.jpegData(compressionQuality: 1) {
                    guard let url = try? self.saveTemporaryImage(photo) else {
                        call.reject("Unable to get portable path to file")
                        return
                    }

                    call.resolve([
                        "value": url.absoluteString
                    ])
                }

                picker.dismiss(animated: true, completion: nil)
            }

            self.bridge?.viewController?.present(picker, animated: true, completion: nil)
        }
    }

    /**
     * Credits: https://github.com/ionic-team/capacitor-plugins/blob/b3a42bb198313066ea502ee94882473247fe0c03/camera/ios/Plugin/CameraPlugin.swift#L518-L527
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
}
