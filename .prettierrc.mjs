import ionicPrettierConfig from '@ionic/prettier-config';

/** @type {import('prettier').Config} */
const config = {
  ...ionicPrettierConfig,

  plugins: ['prettier-plugin-java', 'prettier-plugin-packagejson'],

  overrides: [
    {
      files: '*.java',
      options: {
        tabWidth: 4,
      },
    },
    {
      files: 'tsconfig.json',
      options: {
        parser: 'jsonc',
      },
    },
  ],
};

export default config;
