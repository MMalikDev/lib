// ColorScheme
function setTheme() {
  const theme = document.documentElement.classList;

  const preferenceDark = localStorage.theme === "dark";
  const noPreference = !("theme" in localStorage);
  const defaultDark = window.matchMedia("(prefers-color-scheme: dark)").matches;

  const setDarkMode = preferenceDark || (noPreference && defaultDark);
  setDarkMode ? theme.add("dark") : theme.remove("dark");
}

setTheme();
