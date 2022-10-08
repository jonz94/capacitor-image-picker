import { registerPlugin } from '@capacitor/core';

import type { ImagePickerPlugin } from './definitions';

const ImagePicker = registerPlugin<ImagePickerPlugin>('ImagePicker', {
  web: () => import('./web').then(m => new m.ImagePickerWeb()),
});

export * from './definitions';
export { ImagePicker };
