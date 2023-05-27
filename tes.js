const { startTracking } = require("./kikiMouTrack");

startTracking({
  keyCallback: ()=>{console.log('sdlkf')},
  mouseCallback: ()=>{console.log('lskdjf')}
});