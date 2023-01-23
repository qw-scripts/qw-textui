<script lang="ts">
  import { useNuiEvent } from "../utils/useNuiEvent";
  import { colors, show } from "../store/stores";
  import { onMount } from "svelte";
  import { fetchNui } from "../utils/fetchNui";
  import TextUi from "../components/TextUI.svelte";
  import { isEnvBrowser } from "../utils/misc";

  interface ITextUIOptions {
    message: string;
    type: string;
    icon?: string;
  }

  let messageToShow: string;
  let messageType: string;
  let messageIcon: string | undefined;

  let isVisible: boolean;

  show.subscribe((visible) => {
    isVisible = visible;
  });

  onMount(async () => {
    if (isEnvBrowser()) return;
    const colorList = await fetchNui("qw-textui:GetColorConfig");
    colors.set(colorList);
  });

  useNuiEvent<any>("addTextUI", (data: ITextUIOptions) => {
    const { message, type, icon } = data;
    messageToShow = message;
    messageType = type;
    messageIcon = icon;

    show.set(true);
  });

  useNuiEvent<any>("hideTextUI", () => {
    show.set(false);
  });
</script>

{#if isVisible}
  <TextUi {messageType} {messageIcon}>
    <p>{messageToShow}</p>
  </TextUi>
{/if}
