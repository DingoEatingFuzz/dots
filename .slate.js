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
  S.bind(`${screen+1}:ctrl;alt`, S.op('throw', { screen, width: 'screenSizeX', height: 'screenSizeY' }));
});

// Access frequently used applications with ctrl+#
const appSpeedDial = [
  'iTerm2',
  'Google Chrome',
  'Slack',
  'Figma',
  'Notion',
  'Spotify',
];

appSpeedDial.forEach((app, idx) => {
  S.bind(`${idx+1}:ctrl`, S.op('focus', { app }));
});

// Next up, snapshots and layouts?
