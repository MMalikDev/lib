<script>
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();
	function toggle() {
		dispatch('click', {});
	}

	export let navExpanded = true;
</script>

<button
	id="menu-toggle"
	class="menu-toggle"
	on:click={toggle}
	aria-expanded={navExpanded}
	aria-controls="primary-navigation"
>
	<img src="/assets/menu.svg" alt="menu-toggle" />
	<span class="visually-hidden">menu-toggle</span>
</button>

<style>
	.menu-toggle {
		cursor: pointer;
		background: transparent;
		color: inherit;
		border: none;
		display: flex;
		padding: 0.75rem;
	}
	@media only screen and (min-width: 600px) {
		.menu-toggle {
			display: none;
		}
	}
</style>
