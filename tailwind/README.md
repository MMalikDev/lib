# Tailwind CLI

### Install Tailwind CSS

terminal

```shell
npm install -D tailwindcss && \
npx tailwindcss init
```

### Configure your template paths

tailwind.config.js

```js
content: ["./src/**/*.{html,js}"],
```

### Add the Tailwind directives to your CSS

src/styles.css

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Start the Tailwind CLI build process

terminal

```shell
npx tailwindcss -i ./src/styles.css -o ./dist/styles.css --watch
# or
npx tailwindcss -i ./src/styles.css -o ./dist/styles.css && \
cp ./src/*.{html,js} ./dist
```

<hr>
<hr>
<br>
<br>
<br>
<br>

# PostCSS Plugin

### Install Tailwind CSS

terminal

```shell
npm install -D tailwindcss postcss autoprefixer && \
npx tailwindcss init
```

### Add Tailwind to your PostCSS configuration

postcss.config.js

```js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
};
```

### Configure your template paths

tailwind.config.js

```js
content: ["./src/**/*.{html,js}"];
```

### Add the Tailwind directives to your CSS

src/styles.css

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Start your build process

terminal

```shell
npm run dev
```

<hr>
<hr>
<br>
<br>
<br>
<br>

# Install Tailwind CSS with SvelteKit

### Create Project and Install Tailwind CSS

terminal

```shell
npm init svelte@latest . && \
npm install -D tailwindcss postcss autoprefixer && \
npx tailwindcss init
```

### Enable use of PostCSS in style blocks

svelte.config.js

```js
import adapter from "@sveltejs/adapter-auto";
import { vitePreprocess } from "@sveltejs/kit/vite"; //here
/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter(),
  },
  preprocess: vitePreprocess(), \ //and here
};
export default config;
```

### Configure your template paths

tailwind.config.js

```js
content: ["./src/**/*.{html,js}"];
```

### Add the Tailwind directives to your CSS

src/styles.css

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### Import the CSS file

+layout.svelte

- Create a ./src/routes/+layout.svelte file and import the newly-created styles.css file.

```svelte
<script>
  import "../styles.css";
</script>

<slot />
```

### Start your build process

terminal

```shell
npm run dev
```
