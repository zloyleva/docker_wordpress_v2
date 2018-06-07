let mix = require('laravel-mix');

const js_public_path = 'public/wp-content/themes/laterna/scripts/script.js';
const css_public_path = 'public/wp-content/themes/laterna/styles/style.css';

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('assets/js/app.js', js_public_path)
    .sass('assets/sass/app.scss', css_public_path);
mix.options({ processCssUrls: false });//ignore img paths