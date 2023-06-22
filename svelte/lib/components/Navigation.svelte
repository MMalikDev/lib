<script>
  import Menu from "$lib/components/buttons/Menu.svelte";
  import { page } from "$app/stores";

  let anchors = [
    { id: 1, default: true, name: "Home", link: "/" },
    { id: 2, default: false, name: "Example", link: "/common" },
    { id: 3, default: false, name: "NotFound", link: "/NotFound" },
  ];

  $: navState = "closed";
  $: navExpanded = false;

  function openNavigation() {
    navState = "opened";
    navExpanded = true;
  }
  function closeNavigation() {
    navState = "closed";
    navExpanded = false;
  }

  function toggleNavigation() {
    navExpanded ? closeNavigation() : openNavigation();
  }
</script>

<nav aria-label="Main">
  <Menu {navExpanded} on:click={toggleNavigation} />

  <ul id="primary-navigation" class="primary-navigation" data-state={navState}>
    {#each anchors as anchor (anchor.id)}
      {#if $page.url.pathname == anchor.link}
        <li class="nav-item">
          <a
            class="nav-link"
            aria-current="page"
            href={anchor.link}
            on:click={closeNavigation}
          >
            {anchor.name}
          </a>
        </li>
      {:else}
        <li class="nav-item">
          <a class="nav-link" href={anchor.link} on:click={closeNavigation}>
            {anchor.name}
          </a>
        </li>
      {/if}
    {/each}
  </ul>
</nav>

<style>
  .primary-navigation {
    font-size: 1.5rem;
    min-height: 50dvh;
    position: absolute;
    inset: 100% -100% auto auto;
    gap: 1rem;
    padding: 1rem;
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: space-evenly;
    border-radius: 0 0 0 1rem;
    background-color: var(--component-nav-color-bg);
  }
  .primary-navigation[data-state="opened"] {
    inset: 100% 0 auto;
    animation: open-nav 300ms ease-in;
    box-shadow: 0 0 0 100dvh rgba(0, 0, 0, 0.4);
  }
  .primary-navigation[data-state="closing"] {
    animation: close-nav 300ms ease-out;
  }

  .nav-item {
    display: flex;
  }
  .nav-link {
    color: inherit;
    text-decoration: none;
  }
  .nav-link[aria-current="page"] {
    color: var(--component-nav-color-text);
    border-bottom: 0.125rem solid var(--component-nav-color-border);
  }
  .nav-link:not([aria-current="page"]):hover {
    color: var(--component-nav-color-text-hover);
  }

  @media only screen and (min-width: 600px) {
    .primary-navigation {
      font-size: 1rem;
      position: static;
      background: inherit;
      flex-direction: row;
      min-height: fit-content;
    }
  }
  @keyframes open-nav {
    0% {
      opacity: 0;
      inset: 100% -100% auto auto;
      transform: translateX(100%);
    }
    100% {
      opacity: 1;
      inset: 100% 0 auto;
      transform: translateX(0%);
    }
  }
  @keyframes close-nav {
    0% {
      opacity: 1;
      inset: 100% 0 auto;
      transform: translateX(0%);
    }
    100% {
      opacity: 0;
      inset: 100% -100% auto auto;
      transform: translateX(100%);
    }
  }
</style>
