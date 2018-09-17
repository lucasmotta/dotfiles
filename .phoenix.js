/**
 * Phoenix config
 * ctrl+alt+left = split screen left
 * ctrl+alt+right = split screen right
 * ctrl+alt+up = split screen top
 * ctrl+alt+down = split screen bottom
 * ctrl+alt+return = resize (50% of screen) and center window
 * ctrl+alt+space = full screen
 */
const PADDING = 5
const META = ['ctrl', 'alt', 'cmd']

/**
 * Resize boilerplate
 */
const bind = (key, cb) => new Key(key, META, cb)

const getWindow = cb => {
  var window = Window.focused()
  if (window) {
    cb(window)
  }
}

const resize = (key, cb) =>
  bind(key, () =>
    getWindow(window => {
      var screenFrame = window.screen().flippedVisibleFrame()
      window.setFrame(cb(screenFrame, window))
    })
  )

/**
 * Split Left
 */
const leftHandler = resize('left', frame => ({
  x: PADDING,
  y: PADDING + frame.y,
  width: (frame.width - PADDING) / 2 - PADDING,
  height: frame.height - PADDING * 2,
}))

/**
 * Split Right
 */
const rightHandler = resize('right', frame => ({
  x: (frame.width + PADDING) / 2,
  y: PADDING + frame.y,
  width: (frame.width - PADDING) / 2 - PADDING * 1.5,
  height: frame.height - PADDING * 2,
}))

/**
 * Split Top
 */
const topHandler = resize('up', frame => ({
  x: PADDING,
  y: PADDING + frame.y,
  width: frame.width - PADDING * 2,
  height: Math.ceil((frame.height - frame.y) / 2 + PADDING * 0.5),
}))

/**
 * Split Bototm
 */
const bottomHandler = resize('down', frame => ({
  x: PADDING,
  y: (frame.height + PADDING) / 2 + frame.y,
  width: frame.width - PADDING * 2,
  height: Math.ceil((frame.height - frame.y) / 2 + PADDING * 0.5),
}))

/**
 * Split Center
 */
const centerHandler = resize('return', frame => {
  const width = Math.max(1100, frame.width * 0.5)
  const height = Math.max(600, frame.height * 0.5)
  return {
    width,
    height,
    x: frame.width * 0.5 - width * 0.5,
    y: frame.height * 0.5 - height * 0.5 + frame.y,
  }
})

/**
 * Align Center
 */
const alignCenterHandler = resize('c', (frame, window) => {
  const { width, height } = window.size()
  return {
    width,
    height,
    x: frame.width * 0.5 - width * 0.5,
    y: frame.height * 0.5 - height * 0.5 + frame.y,
  }
})

/**
 * Full Screen
 */
const fullHandler = resize('space', frame => ({
  x: PADDING,
  y: PADDING + frame.y,
  width: frame.width - PADDING * 2,
  height: frame.height - PADDING * 2,
}))

/**
 * Dev Mode
 *
 * - check if there's the Simulator app running
 * - moves the Simulator to the top right
 * - moves the VSCode to the left and fill the remaining available space (with Simulator or not)
 * - moves the React Native Debugger to the same position as VSCode
 */
const devHandler = bind('d', () =>
  getWindow(window => {
    const simulator = App.get('Simulator')
    const code = App.get('Code')
    const reactDebugger = App.get('React Native Debugger')
    const frame = window.screen().flippedVisibleFrame()
    let simulatorSize
    let simulatorWidth = 0

    if (simulator) {
      simulatorSize = simulator.mainWindow().size()
      simulatorWidth = simulatorSize.width ? simulatorSize.width + PADDING : 0
    }

    const devFrame = {
      x: PADDING,
      y: PADDING + frame.y,
      width: frame.width - simulatorWidth - PADDING * 2,
      height: frame.height - PADDING * 2,
    }

    // Resize ALL VSCode windows
    if (code) {
      code.focus()
      code.windows().map(window => {
        window.setFrame(devFrame)
      })
    }

    // Resize the main React Native Debugger window
    if (reactDebugger) {
      reactDebugger.mainWindow().setFrame(devFrame)
    }

    // Resize the main Simulator window
    if (simulator) {
      simulator.mainWindow().setFrame({
        x: frame.width - simulatorSize.width - PADDING,
        y: PADDING + frame.y,
        width: simulatorSize.width,
        height: simulatorSize.height,
      })
    }
  })
)
