export interface ImagePickerPlugin {
  present(options?: presentOptions): Promise<Images>;
}

export interface presentOptions {
  /**
   * Maximum number of pictures the user will be able to choose. If this is set to 1, upon selection of a single image.
   *
   * @default 1
   */
  limit?: number;
}

export interface Images {
  images: Image[];
}

export interface Image {
  /**
   * The file path of the image.
   */
  path: string;

  /**
   * webPath returns a path that can be used to set the src attribute of an image for efficient
   * loading and rendering.
   */
  webPath: string;

  /**
   * The mime type of the image.
   */
  mimeType: string;
}
