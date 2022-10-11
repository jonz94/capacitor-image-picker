export interface ImagePickerPlugin {
  present(): Promise<Result>;
}

export interface Result {
  image: Image;
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
