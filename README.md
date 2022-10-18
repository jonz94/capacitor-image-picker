<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>
<h3 align="center">Image Picker</h3>
<p align="center"><strong><code>@jonz94/capacitor-image-picker</code></strong></p>
<p align="center">
  Capacitor plugin for multiple image selection.
</p>

<p align="center">
  <a href="https://www.npmjs.com/package/@jonz94/capacitor-image-picker"><img src="https://img.shields.io/npm/l/@jonz94/capacitor-image-picker?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@jonz94/capacitor-image-picker"><img src="https://img.shields.io/npm/v/@jonz94/capacitor-image-picker?style=flat-square" /></a>
</p>

## Install

```bash
npm install @jonz94/capacitor-image-picker
npx cap sync
```

## iOS

This plugin uses [a forked version](https://github.com/jonz94/YPImagePicker) of [YPImagePicker](https://github.com/Yummypets/YPImagePicker) under the hood.

In order to use this plugin, you need to manually modified `ios/App/Podfile` as following:

```diff
target 'App' do
  capacitor_pods
  # Add your Pods here
+  pod 'YPImagePicker', :git => 'https://github.com/jonz94/YPImagePicker.git', :tag => '5.2.1.0'
end
```

After modified `ios/App/Podfile`, make sure to run `pod update` command to sync up the iOS project.

## Android

This plugin uses [a forked version](https://github.com/jonz94/TedIamgePicker) of [TedImagePicker](https://github.com/ParkSangGwon/TedImagePicker) under the hood.

In order to use this plugin, you need to manually modified `android/build.gradle` as following:

```diff
allprojects {
    repositories {
        google()
        mavenCentral()
+        maven { url "https://jitpack.io" }
    }
}
```

After modified `android/build.gradle`, make sure to run `Sync Project with Gradle Files` in Android Studio.

### Variables

This plugin will use the following project variables (defined in your app's `variables.gradle` file):
- `$tedImagePickerVersion` version of `com.github.jonz94:TedImagePicker` (default: `1.3.2.1`)

## Configuration

No configuration required for this plugin.

## Usage

```typescript
import { ImagePicker } from '@jonz94/capacitor-image-picker';

const pickSingleImage = async () => {
  const { images } = await ImagePicker.present();

  console.log(images[0]);
}

const pickMultipleImage = async () => {
  const { images } = await ImagePicker.present({ limit: 10 });

  console.log(images);
}

const pickWithCustomText = async () => {
  const { images } = await ImagePicker.present({
    limit: 10,
    surpassLimitMessage: 'The limit is %d image(s).',
    titleText: 'Pick a image',
    albumsTitleText: 'Chose an album',
    libraryTitleText: 'Click here to change library',
    cancelText: 'Go Back',
    doneText: 'OK',
  });

  console.log(images);
}
```

## API

<docgen-index>

* [`present(...)`](#present)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### present(...)

```typescript
present(options?: presentOptions | undefined) => Promise<Images>
```

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#presentoptions">presentOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#images">Images</a>&gt;</code>

--------------------


### Interfaces


#### Images

| Prop         | Type                 | Description                     | Since |
| ------------ | -------------------- | ------------------------------- | ----- |
| **`images`** | <code>Image[]</code> | Array of all the picked images. | 1.0.0 |


#### Image

| Prop           | Type                | Description                                                                                                       | Since |
| -------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------- | ----- |
| **`path`**     | <code>string</code> | The file path of the image.                                                                                       | 1.0.0 |
| **`webPath`**  | <code>string</code> | webPath returns a path that can be used to set the src attribute of an image for efficient loading and rendering. | 1.0.0 |
| **`mimeType`** | <code>string</code> | The mime type of the image.                                                                                       | 1.0.0 |


#### presentOptions

| Prop                      | Type                | Description                                                                                                                                                                                                                   | Default                                         | Since |
| ------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- | ----- |
| **`limit`**               | <code>number</code> | Maximum number of images the user will be able to choose. Note: If this is set to 1, upon selection of a single image.                                                                                                        | <code>1</code>                                  | 1.0.0 |
| **`surpassLimitMessage`** | <code>string</code> | The message when user select more than maximum number of pictures. This message will not occur when `limit` is 1. Note: The message **MUST INCLUDE ONE AND ONLY ONE `%d`** as a placeholder for showing the value of `limit`. | <code>"You can only select %d image(s)."</code> | 1.0.0 |
| **`titleText`**           | <code>string</code> | Android only: The title of the image picker.                                                                                                                                                                                  | <code>"Select Image"</code>                     | 1.0.0 |
| **`libraryTitleText`**    | <code>string</code> | iOS only: The title of the library.                                                                                                                                                                                           | <code>"Library"</code>                          | 1.0.0 |
| **`albumsTitleText`**     | <code>string</code> | iOS only: The title of the albums.                                                                                                                                                                                            | <code>"Albums"</code>                           | 1.0.0 |
| **`cancelText`**          | <code>string</code> | iOS only: The text to display on the cancel button. Note: on Android, the cancel button is shown as icon-only back button with no text.                                                                                       | <code>"Cancel"</code>                           | 1.0.0 |
| **`doneText`**            | <code>string</code> | The text to display on the done button.                                                                                                                                                                                       | <code>"Done"</code>                             | 1.0.0 |

</docgen-api>

## Changelog

See [CHANGELOG.md](https://github.com/jonz94/capacitor-image-picker/blob/main/CHANGELOG.md).

## License

See [LICENSE](https://github.com/jonz94/capacitor-image-picker/blob/main/LICENSE).

## Credits

- [EinfachHans's Advanced ImagePicker Cordova Plugin](https://github.com/EinfachHans/cordova-plugin-advanced-imagepicker) inspires this Capacitor plugin.
- [YPImagePicker](https://github.com/Yummypets/YPImagePicker) provides iOS implementation.
- [TedImagePicker](https://github.com/ParkSangGwon/TedImagePicker) provides Android implementation.
- [Official Capacitor Camera Plugin](https://github.com/ionic-team/capacitor-plugins/blob/%40capacitor/camera%404.1.2/camera/ios/Plugin/CameraPlugin.swift#L518-L527) provides `saveTemporaryImage()` implementation on iOS.
- [Capawesome's Capacitor File Picker Plugin](https://github.com/capawesome-team/capacitor-file-picker/blob/v0.5.1/ios/Plugin/FilePicker.swift#L37-L46) provides `getMimeTypeFromURL()` implementation on iOS.
