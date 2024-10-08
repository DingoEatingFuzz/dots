// Defaults
S.configAll({
  defaultToCurrentScreen: true,
  secondsBetweenRepeat: 0.1,
  checkDefaultsOnLoad: true,
  focusCheckWidthMax: 3000,
  orderScreensLeftToRight: true
});

// Default resizing & nudging
const cardinals = ['right', 'down', 'left', 'up'];
cardinals.forEach((direction, idx) => {
  const f = 10;
  const xMag = (idx + 1) % 2 * f;
  const yMag = idx % 2 * f;
  const s = '++--'[idx];
  const is = '--++'[idx];

  S.bind(`${direction}:alt`, S.op('resize', { width: `${s}${xMag}%`, height: `${s}${yMag}%` }));
  S.bind(`${direction}:ctrl;alt`, S.op('resize', { width: `${is}${xMag}%`, height: `${is}${yMag}%`, anchor: 'bottom-right' }));
  S.bind( `${direction}:shift;alt`, S.op('nudge', { x: `${s}${xMag}%`, y: `${s}${yMag}%` }));
});

// Default throws
[0, 1, 2].forEach(screen => {
  S.bind(`${screen+1}:ctrl;alt`, win => {
    const count = S.screenCount();
    if (count > 1) {
      win.doOperation(S.op('throw', { screen, width: 'screenSizeX', height: 'screenSizeY' }));
    } else {
      // Based on the screen number and the window size, cycle through size variations
      const width = win.size().width;
      const sWidth = win.screen().rect().width;
      const pct = width / sWidth;
      if (screen === 0) {
        const newWidth = pct <= 0.4 ? sWidth
          : pct <= 0.6 ? sWidth / 3
          : sWidth / 2;
        win.doOperation(S.op('throw', { screen, width: newWidth, height: 'screenSizeY' }));
      } else if (screen === 1) {
        const newWidth = pct <= 0.4 || pct >= 0.6 ? sWidth / 2 : sWidth / 3;
        win.doOperation(S.op('throw', { screen, width: newWidth, height: 'screenSizeY', x: newWidth }));
      } else {
        win.doOperation(S.op('throw', { screen, width: sWidth / 3, height: 'screenSizeY', x: sWidth / 3 * 2 }));
      }
    }
  });
});

// Two-thirds throws
[0, 1].forEach(screen => {
  S.bind(`${screen+1}:ctrl;alt;shift`, win => {
    if (S.screenCount() === 1) {
      const sWidth = win.screen().rect().width;
      win.doOperation(S.op('throw', { screen, width: sWidth / 3 * 2, height: 'screenSizeY', x: sWidth / 3 * screen }))
    }
  });
});


// Access frequently used applications with ctrl+#
const appSpeedDial = [
  'Alacritty',
  'Google Chrome',
  'Slack',
  'Figma',
  'Nota',
  'Spotify',
];

appSpeedDial.forEach((app, idx) => {
  S.bind(`${idx+1}:ctrl`, S.op('focus', { app }));
});

// Next up, snapshots and layouts?
