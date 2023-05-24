const addon = require('./build/Release/addon');

const startTracking = addon.startInputTracking;


// addon.startInputTracking({
//   keyCallback: onKeyPress,
//   mouseCallback: onMouseMove
// });


module.exports = {
  startTracking
};