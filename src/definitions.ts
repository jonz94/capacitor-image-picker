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
   * The mime type of the image.
   */
  mimeType: string;
}
