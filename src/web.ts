import { WebPlugin } from '@capacitor/core';

import type { ImagePickerPlugin } from './definitions';

export class ImagePickerWeb extends WebPlugin implements ImagePickerPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
