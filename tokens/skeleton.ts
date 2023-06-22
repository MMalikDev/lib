import type { CustomThemeConfig } from "@skeletonlabs/tw-plugin";

export const myCustomTheme: CustomThemeConfig = {
  name: "my-custom-theme",
  properties: {
    // =~= Theme Properties =~=
    "--theme-font-family-base": `ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace`,
    "--theme-font-family-heading": `Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'`,
    "--theme-font-color-base": "0 0 0",
    "--theme-font-color-dark": "255 255 255",
    "--theme-rounded-base": "8px",
    "--theme-rounded-container": "16px",
    "--theme-border-base": "1px",
    // =~= Theme On-X Colors =~=
    "--on-primary": "255 255 255",
    "--on-secondary": "0 0 0",
    "--on-tertiary": "255 255 255",
    "--on-success": "255 255 255",
    "--on-warning": "0 0 0",
    "--on-error": "0 0 0",
    "--on-surface": "255 255 255",
    // =~= Theme Colors  =~=
    // primary | #3333CC
    "--color-primary-50": "224 224 247", // #e0e0f7
    "--color-primary-100": "214 214 245", // #d6d6f5
    "--color-primary-200": "204 204 242", // #ccccf2
    "--color-primary-300": "173 173 235", // #adadeb
    "--color-primary-400": "112 112 219", // #7070db
    "--color-primary-500": "51 51 204", // #3333CC
    "--color-primary-600": "46 46 184", // #2e2eb8
    "--color-primary-700": "38 38 153", // #262699
    "--color-primary-800": "31 31 122", // #1f1f7a
    "--color-primary-900": "25 25 100", // #191964
    // secondary | #08a1b2
    "--color-secondary-50": "218 241 243", // #daf1f3
    "--color-secondary-100": "206 236 240", // #ceecf0
    "--color-secondary-200": "193 232 236", // #c1e8ec
    "--color-secondary-300": "156 217 224", // #9cd9e0
    "--color-secondary-400": "82 189 201", // #52bdc9
    "--color-secondary-500": "8 161 178", // #08a1b2
    "--color-secondary-600": "7 145 160", // #0791a0
    "--color-secondary-700": "6 121 134", // #067986
    "--color-secondary-800": "5 97 107", // #05616b
    "--color-secondary-900": "4 79 87", // #044f57
    // tertiary | #757575
    "--color-tertiary-50": "234 234 234", // #eaeaea
    "--color-tertiary-100": "227 227 227", // #e3e3e3
    "--color-tertiary-200": "221 221 221", // #dddddd
    "--color-tertiary-300": "200 200 200", // #c8c8c8
    "--color-tertiary-400": "158 158 158", // #9e9e9e
    "--color-tertiary-500": "117 117 117", // #757575
    "--color-tertiary-600": "105 105 105", // #696969
    "--color-tertiary-700": "88 88 88", // #585858
    "--color-tertiary-800": "70 70 70", // #464646
    "--color-tertiary-900": "57 57 57", // #393939
    // success | #166500
    "--color-success-50": "220 232 217", // #dce8d9
    "--color-success-100": "208 224 204", // #d0e0cc
    "--color-success-200": "197 217 191", // #c5d9bf
    "--color-success-300": "162 193 153", // #a2c199
    "--color-success-400": "92 147 77", // #5c934d
    "--color-success-500": "22 101 0", // #166500
    "--color-success-600": "20 91 0", // #145b00
    "--color-success-700": "17 76 0", // #114c00
    "--color-success-800": "13 61 0", // #0d3d00
    "--color-success-900": "11 49 0", // #0b3100
    // warning | #eab308
    "--color-warning-50": "252 244 218", // #fcf4da
    "--color-warning-100": "251 240 206", // #fbf0ce
    "--color-warning-200": "250 236 193", // #faecc1
    "--color-warning-300": "247 225 156", // #f7e19c
    "--color-warning-400": "240 202 82", // #f0ca52
    "--color-warning-500": "234 179 8", // #eab308
    "--color-warning-600": "211 161 7", // #d3a107
    "--color-warning-700": "176 134 6", // #b08606
    "--color-warning-800": "140 107 5", // #8c6b05
    "--color-warning-900": "115 88 4", // #735804
    // error | #ef4444
    "--color-error-50": "253 227 227", // #fde3e3
    "--color-error-100": "252 218 218", // #fcdada
    "--color-error-200": "251 208 208", // #fbd0d0
    "--color-error-300": "249 180 180", // #f9b4b4
    "--color-error-400": "244 124 124", // #f47c7c
    "--color-error-500": "239 68 68", // #ef4444
    "--color-error-600": "215 61 61", // #d73d3d
    "--color-error-700": "179 51 51", // #b33333
    "--color-error-800": "143 41 41", // #8f2929
    "--color-error-900": "117 33 33", // #752121
    // surface | #363636
    "--color-surface-50": "225 225 225", // #e1e1e1
    "--color-surface-100": "215 215 215", // #d7d7d7
    "--color-surface-200": "205 205 205", // #cdcdcd
    "--color-surface-300": "175 175 175", // #afafaf
    "--color-surface-400": "114 114 114", // #727272
    "--color-surface-500": "54 54 54", // #363636
    "--color-surface-600": "49 49 49", // #313131
    "--color-surface-700": "41 41 41", // #292929
    "--color-surface-800": "32 32 32", // #202020
    "--color-surface-900": "26 26 26", // #1a1a1a
  },
};
