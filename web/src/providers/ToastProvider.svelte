<script lang="ts">
  import { useNuiEvent } from "../utils/useNuiEvent";
  import { colors, show } from "../store/stores";
  import { onMount } from "svelte";
  import { fetchNui } from "../utils/fetchNui";
  import TextUi from "../components/TextUI.svelte";

  let messageToShow: string;
  let messageType: string;
  let isVisible: boolean;

  show.subscribe((visible) => {
    isVisible = visible;
  });

  onMount(async () => {
    const colorList = await fetchNui("qw-textui:GetColorConfig");
    colors.set(colorList);
  });

  useNuiEvent<any>("addTextUI", (data) => {
    const { message, type } = data;
    messageToShow = message;
    messageType = type;
    show.set(true);
  });

  useNuiEvent<any>("hideTextUI", () => {
    show.set(false);
  });
</script>

<main>
  {#if isVisible}
    <TextUi {messageType}>
      {messageToShow}
    </TextUi>
  {/if}
</main>
