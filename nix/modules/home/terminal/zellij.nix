{ ... }:

{
  programs.zellij = {
    enable = true;

    settings = {
      theme = "catppuccin-mocha";

      pane_frames = true;
      mouse_mode = true;
      scroll_buffer_size = 10000;
      copy_on_select = true;

      default_layout = "compact";

      simplified_ui = false;

      default_shell = "zsh";
      session_serialization = true;

      default_mode = "normal";
    };
  };
}
