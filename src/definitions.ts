export interface ImagePickerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
