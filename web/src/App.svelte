<script>
  import ToastProvider from "./providers/ToastProvider.svelte";
  import { debugData } from "./utils/debugData";
  import { isEnvBrowser } from "./utils/misc";

  if (isEnvBrowser()) {
    debugData([
      {
        action: "addTextUI",
        data: {
          message: '[E] Press this here cause its really cool!',
          type: "primary",
          icon: "fas fa-bolt",
        },
      },
    ]);
  }
</script>

<main class="container">
  <ToastProvider />
</main>

<style>
  .container {
    position: absolute;
    top: 0;
    left: 0;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    height: 100%;
    width: 100%;
    user-select: none;
  }
</style>
