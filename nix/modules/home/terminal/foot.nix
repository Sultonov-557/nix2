{ lib, ... }: {
  programs.foot = {
    enable = true;

    settings = {
      cursor = {
        style = "block";
        blink = "yes";
      };

      #keybind = [
      #  "ctrl+shift+c=copy_to_clipboard"
      #  "ctrl+shift+v=paste_from_clipboard"
      #  "ctrl+shift+t=new_tab"
      #  "ctrl+shift+w=close_surface"
      #  "ctrl+shift+n=new_window"
      #  "copy=copy_to_clipboard"
      #  "paste=paste_from_clipboard"
      #  "ctrl+==increase_font_size:1"
      #  "ctrl+-=decrease_font_size:1"
      #];
    };
  };
}
