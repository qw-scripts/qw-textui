import { writable } from "svelte/store";

export const colors = writable<any>({});
export const show = writable<boolean>(false);
