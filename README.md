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

| Prop        | Type                | Description                                                                                                        | Default        |
| ----------- | ------------------- | ------------------------------------------------------------------------------------------------------------------ | -------------- |
| **`limit`** | <code>number</code> | Maximum number of pictures the user will be able to choose. If this is set to 1, upon selection of a single image. | <code>1</code> |

</docgen-api>
