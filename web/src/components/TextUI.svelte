<script lang="ts">
  import { isEnvBrowser } from "../utils/misc";
import { fade } from "svelte/transition";
  import { colors } from "../store/stores";

  let configColors: any;
  export let messageType: string;
  export let messageIcon: string | undefined;

  colors.subscribe((colors) => {
    configColors = colors;
  });
</script>

<section>
  <article
    style="background: { isEnvBrowser() ? 'black' : configColors[messageType]?.main}; border: 2px solid {isEnvBrowser() ? 'lightgray' : configColors[messageType]?.border}; color: {isEnvBrowser() ? 'white' : configColors[messageType]?.fontColor};"
    class="px-4 py-2"
    role="alert"
    transition:fade
  >
    <div class="text-sm font-semibold whitespace-nowrap flex items-center">
      {#if messageIcon}
        <i class="{messageIcon} fa-fw flex items-center justify-center mr-2" style="color: {isEnvBrowser() ? 'white' : configColors[messageType]?.fontColor};" />
      {/if}
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
    width: fit-content;
  }

  section {
    position: absolute;
    top: 50%;
    left: 10px;
    width: 100%;
    height: 100%;
  }
</style>
