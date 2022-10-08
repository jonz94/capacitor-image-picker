export interface ImagePickerPlugin {
  present(): Promise<{ value: string }>;
}
