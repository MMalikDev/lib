<script>
  import Logo from "$lib/components/icons/Logo.svelte";
  import SkipNav from "$lib/components/buttons/SkipNav.svelte";
  import Navigation from "$lib/components/Navigation.svelte";
</script>

<header class="page-header">
  <SkipNav />
  <Logo />
  <Navigation />
</header>

<style>
  header {
    z-index: 999;
    position: relative;
  }
  .page-header {
    width: 100%;
    display: flex;
    padding: 0 2rem;
    position: fixed;
    inset: 0 0 auto 0;
    justify-content: space-between;
    background-color: var(--component-header-color-bg);
  }

  @media only screen and (min-width: 600px) {
    .page-header {
      padding: 0 4rem;
    }
  }
</style>
