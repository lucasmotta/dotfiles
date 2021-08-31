/**
 * Phoenix config
 * ctrl+alt+left = split screen left
 * ctrl+alt+right = split screen right
 * ctrl+alt+up = split screen top
 * ctrl+alt+down = split screen bottom
 * ctrl+alt+return = resize (50% of screen) and center window
 * ctrl+alt+space = full screen
 */
const PADDING = 5;
const META = ["ctrl", "alt", "cmd"];

/**
 * Resize boilerplate
 */
const bind = (key, cb) => new Key(key, META, cb);

const getWindow = (cb) => {
  var window = Window.focused();
  if (window) {
    cb(window);
  }
};

const resize = (key, cb) =>
  bind(key, () =>
    getWindow((window) => {
      var screenFrame = Screen.main().flippedVisibleFrame();
      window.setFrame(cb(screenFrame, window));
    })
  );

/**
 * Split Left
 */
const leftHandler = resize("left", (frame) => ({
  x: frame.x + PADDING,
  y: frame.y + PADDING,
  width: frame.width / 2 - PADDING * 1.5,
  height: frame.height - PADDING * 2,
}));

/**
 * Split Right
 */
const rightHandler = resize("right", (frame) => ({
  x: frame.x + frame.width / 2 + PADDING * 0.5,
  y: frame.y + PADDING,
  width: frame.width / 2 - PADDING * 1.5,
  height: frame.height - PADDING * 2,
}));

/**
 * Split Top
 */
const topHandler = resize("up", (frame) => ({
  x: frame.x + PADDING,
  y: frame.y + PADDING,
  width: frame.width - PADDING * 2,
  height: Math.ceil(frame.height / 2 - PADDING * 1.5),
}));

/**
 * Split Bototm
 */
const bottomHandler = resize("down", (frame) => ({
  x: frame.x + PADDING,
  y: frame.y + frame.height / 2 + PADDING * 0.5,
  width: frame.width - PADDING * 2,
  height: Math.ceil(frame.height / 2 - PADDING * 1.5),
}));

/**
 * Split Center
 */
const centerHandler = resize("return", (frame) => {
  const width = Math.max(1100, frame.width * 0.5);
  const height = Math.max(600, frame.height * 0.5);
  return {
    width,
    height,
    x: frame.x + frame.width * 0.5 - width * 0.5,
    y: frame.y + frame.height * 0.5 - height * 0.5,
  };
});

/**
 * Align Center
 */
const alignCenterHandler = resize("c", (frame, window) => {
  const { width, height } = window.size();
  return {
    width,
    height,
    x: frame.x + frame.width * 0.5 - width * 0.5,
    y: frame.y + frame.height * 0.5 - height * 0.5,
  };
});

/**
 * Full Screen
 */
const fullHandler = resize("space", (frame) => ({
  x: frame.x + PADDING,
  y: frame.y + PADDING,
  width: frame.width - PADDING * 2,
  height: frame.height - PADDING * 2,
}));

/**
 * Dev Mode
 *
 * - check if there's the Simulator app running
 * - moves the Simulator to the top right
 * - moves the VSCode to the left and fill the remaining available space (with Simulator or not)
 * - moves the React Native Debugger to the same position as VSCode
 */
const devHandler = bind("d", () =>
  getWindow((window) => {
    const simulator = App.all().find(
      (app) => app.bundleIdentifier() === "com.apple.iphonesimulator"
    );
    const code = App.get("Code");
    const reactDebugger = App.get("React Native Debugger");
    const reactotron = App.get("Reactotron");
    const frame = window.screen().flippedVisibleFrame();
    let simulatorSize;
    let simulatorWidth = 0;

    if (simulator) {
      simulatorSize = simulator.mainWindow().size();
      simulatorWidth = simulatorSize.width ? simulatorSize.width + PADDING : 0;
    }

    const codeFrame = {
      x: frame.x + PADDING,
      y: frame.y + PADDING,
      width: frame.width / 2 - PADDING * 1.5,
      height: frame.height - PADDING * 2,
    };

    const debugFrame = {
      x: frame.x + frame.width / 2 + PADDING * 0.5 + simulatorWidth,
      y: frame.y + PADDING,
      width: frame.width / 2 - PADDING * 1.5 - simulatorWidth,
      height: frame.height - PADDING * 2,
    };

    // Resize ALL VSCode windows
    if (code) {
      // code.focus()
      code.windows().map((window) => {
        window.setFrame(codeFrame);
      });
    }

    // Resize the main React Native Debugger window
    if (reactDebugger) {
      reactDebugger.windows().map((window) => {
        window.setFrame(debugFrame);
      });
    }

    // Resize the main React Native Debugger window
    if (reactotron) {
      reactotron.windows().map((window) => {
        window.setFrame(debugFrame);
      });
    }

    // Resize the main Simulator window
    if (simulator) {
      simulator.mainWindow().setFrame({
        x: frame.x + frame.width / 2 + PADDING * 0.5,
        y: frame.y + PADDING,
        width: simulatorSize.width,
        height: simulatorSize.height,
      });
    }
  })
);
