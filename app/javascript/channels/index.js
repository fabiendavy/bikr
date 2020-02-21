// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import { setBannerHeight } from './home.js'
import { updateCalendarPrice } from './updateCalendarPrice'

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector('.banner')) {
    setBannerHeight();
  }
});
if (document.querySelector('.banner')) {
  setBannerHeight();
}

