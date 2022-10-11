# @jonz94/capacitor-image-picker

image picker

## Install

```bash
npm install @jonz94/capacitor-image-picker
npx cap sync
```

## API

<docgen-index>

* [`present()`](#present)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### present()

```typescript
present() => Promise<Result>
```

**Returns:** <code>Promise&lt;<a href="#result">Result</a>&gt;</code>

--------------------


### Interfaces


#### Result

| Prop        | Type                                    |
| ----------- | --------------------------------------- |
| **`image`** | <code><a href="#image">Image</a></code> |


#### Image

| Prop           | Type                | Description                 |
| -------------- | ------------------- | --------------------------- |
| **`path`**     | <code>string</code> | The file path of the image. |
| **`mimeType`** | <code>string</code> | The mime type of the image. |

</docgen-api>
