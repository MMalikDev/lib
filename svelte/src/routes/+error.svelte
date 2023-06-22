<script>
  // import BtnPrimary from '$lib/components/buttons/BtnPrimary.svelte';
</script>

<svelte:head>
  <title>Not Found</title>
  <meta name="Example" content="App" />
</svelte:head>

<section>
  <h1>
    <span> 404 </span>
    <span> Not Found </span>
  </h1>
  <p>This page was not found.</p>
</section>

<style>
  section {
    height: 100dvh;
    display: grid;
    padding: 10rem;
    place-items: center;
  }
  h1 {
    max-width: 8ch;
    font-size: 4rem;
    font-weight: 500;
    line-height: 1.25;
  }
</style>
