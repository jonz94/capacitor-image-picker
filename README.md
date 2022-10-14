# @jonz94/capacitor-image-picker

image picker

## Install

```bash
npm install @jonz94/capacitor-image-picker
npx cap sync
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

| Prop         | Type                 |
| ------------ | -------------------- |
| **`images`** | <code>Image[]</code> |


#### Image

| Prop           | Type                | Description                                                                                                       |
| -------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **`path`**     | <code>string</code> | The file path of the image.                                                                                       |
| **`webPath`**  | <code>string</code> | webPath returns a path that can be used to set the src attribute of an image for efficient loading and rendering. |
| **`mimeType`** | <code>string</code> | The mime type of the image.                                                                                       |


#### presentOptions

| Prop                      | Type                | Description                                                                                                                                                                                                                   | Default                                         |
| ------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| **`limit`**               | <code>number</code> | Maximum number of images the user will be able to choose. Note: If this is set to 1, upon selection of a single image.                                                                                                        | <code>1</code>                                  |
| **`surpassLimitMessage`** | <code>string</code> | The message when user select more than maximum number of pictures. This message will not occur when `limit` is 1. Note: The message **MUST INCLUDE ONE AND ONLY ONE `%d`** as a placeholder for showing the value of `limit`. | <code>"You can only select %d image(s)."</code> |
| **`titleText`**           | <code>string</code> | Android only: The title of the image picker.                                                                                                                                                                                  | <code>"Select Image"</code>                     |
| **`libraryTitleText`**    | <code>string</code> | iOS only: The title of the library.                                                                                                                                                                                           | <code>"Library"</code>                          |
| **`albumsTitleText`**     | <code>string</code> | iOS only: The title of the albums.                                                                                                                                                                                            | <code>"Albums"</code>                           |
| **`cancelText`**          | <code>string</code> | iOS only: The text to display on the cancel button. Note: on Android, the cancel button is shown as icon-only back button with no text.                                                                                       | <code>"Cancel"</code>                           |
| **`doneText`**            | <code>string</code> | The text to display on the done button.                                                                                                                                                                                       | <code>"Done"</code>                             |

</docgen-api>
