export interface ImagePickerPlugin {
  present(options?: presentOptions): Promise<Images>;
}

export interface presentOptions {
  /**
   * Maximum number of images the user will be able to choose.
   *
   * Note: If this is set to 1, upon selection of a single image.
   *
   * @default 1
   * @since 1.0.0
   */
  limit?: number;

  /**
   * The message when user select more than maximum number of pictures. This message will not occur when `limit` is 1.
   *
   * Note: The message **MUST INCLUDE ONE AND ONLY ONE `%d`** as a placeholder for showing the value of `limit`.
   *
   * @default "You can only select %d image(s)."
   * @since 1.0.0
   */
  surpassLimitMessage?: string;

  /**
   * Android only: The title of the image picker.
   *
   * @default "Select Image"
   * @since 1.0.0
   */
  titleText?: string;

  /**
   * Android only: name of the all photos album.
   *
   * @default "All"
   * @since 1.2.0
   */
  albumAllText?: string;

  /**
   * iOS only: The title of the library.
   *
   * @default "Library"
   * @since 1.0.0
   */
  libraryTitleText?: string;

  /**
   * iOS only: The title of the albums.
   *
   * @default "Albums"
   * @since 1.0.0
   */
  albumsTitleText?: string;

  /**
   * iOS only: The text to display on the cancel button.
   *
   * Note: on Android, the cancel button is shown as icon-only back button with no text.
   *
   * @default "Cancel"
   * @since 1.0.0
   */
  cancelText?: string;

  /**
   * The text to display on the done button.
   *
   * @default "Done"
   * @since 1.0.0
   */
  doneText?: string;
}

export interface Images {
  /**
   * Array of all the picked images.
   *
   * @since 1.0.0
   */
  images: Image[];
}

export interface Image {
  /**
   * The file path of the image.
   *
   * @since 1.0.0
   */
  path: string;

  /**
   * webPath returns a path that can be used to set the src attribute of an image for efficient
   * loading and rendering.
   *
   * @since 1.0.0
   */
  webPath: string;

  /**
   * The mime type of the image.
   *
   * @since 1.0.0
   */
  mimeType: string;
}
