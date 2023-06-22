<script>
  import Header from "$lib/components/Header.svelte";
  import Footer from "$lib/components/Footer.svelte";
</script>

<div class="app">
  <Header />

  <main id="content">
    <slot />
  </main>

  <Footer />
</div>

<style>
  .app {
    position: relative;
    min-height: 100dvh;
  }
  main {
    --header-height: 3.5rem;

    margin: var(--header-height) auto 0;
    min-height: 100dvh;
  }
</style>
