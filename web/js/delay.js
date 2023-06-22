const defaultDelay = 100;

function debounce(cb, delay = defaultDelay) {
  let timeout;

  return (...args) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      cb(...args);
    }, delay);
  };
}

function throttle(cb, delay = defaultDelay) {
  let shouldWait = false;
  let waitingArgs;

  const timeoutFunc = () => {
    if (waitingArgs == null) {
      shouldWait = false;
    } else {
      cb(...waitingArgs);
      waitingArgs = null;
      setTimeout(timeoutFunc, delay);
    }
  };

  return (...args) => {
    if (shouldWait) {
      waitingArgs = args;
      return;
    }

    cb(...args);
    shouldWait = true;

    setTimeout(timeoutFunc, delay);
  };
}

export { debounce, throttle };

function delayShowcase() {
  const defaultText = document.getElementById("showcase-default");
  const debounceText = document.getElementById("showcase-debounce");
  const throttleText = document.getElementById("showcase-throttle");

  const update = (e) => (e.textContent = (parseInt(e.innerText) || 0) + 1);
  const updateDebounceText = debounce(() => update(debounceText));
  const updateThrottleText = throttle(() => update(throttleText));

  document.addEventListener("mousemove", (e) => {
    update(defaultText);
    updateDebounceText();
    updateThrottleText();
  });
}
