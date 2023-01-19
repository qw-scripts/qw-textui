<script lang="ts">
  import { fade } from "svelte/transition";
  import { colors } from "../store/stores";

  let configColors: any;
  export let messageType: string;

  colors.subscribe((colors) => {
    configColors = colors;
  });
</script>

<section>
  <article
    style="background: {configColors[messageType].main}; border: 2px solid {configColors[messageType].border}; color: {configColors[messageType].fontColor}; font-family: {configColors[messageType].fontFamily};"
    class="px-4 py-2"
    role="alert"
    transition:fade
  >
    <div class="text font-semibold whitespace-nowrap">
      <slot />
    </div>
  </article>
</section>

<style>
  article {
    color: white;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    @apply shadow-inner;
  }

  section {
    position: fixed;
    top: 50%;
    left: 10%;
    transform: translate(-50%, -50%);
    display: flex;
    margin-top: 1rem;
    justify-content: center;
    flex-direction: column;
    z-index: 1000;
  }

  .text {
    font-size: 14px;
  }
</style>
