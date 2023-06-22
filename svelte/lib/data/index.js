import { writable } from "svelte/store";
// Sample Code
// // const apiEndpoint = process.env.API_ENDPOINT;
// const apiEndpoint = '//localhost:8080/images'
// let loading = false;
// let noMoreData = false;
// let data = [];
// let page = 1;

// const list = writable({
// 	data,
// 	loading,
// 	noMoreData
// });
// export default {
// 	subscribe: list.subscribe,
// 	async fetchMore() {
// 		if (loading || noMoreData) return;
// 		loading = true;

// 		// list.set({ data, loading, noMoreData });
// 		list.update((currentList) => {
// 			return { ...currentList, loading };
// 		});

// 		const response = await fetch(`${apiEndpoint}?page=${page++}&limit=10`);
// 		const newData = await response.json();

// 		loading = false;
// 		noMoreData = newData.length === 0;

// 		data.push(...newData);
// 		list.set({ data, loading, noMoreData });
// 	}
// };
