{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    # font = {
    #   # package = pkgs.recursive;
    #   name = "monospace";
    #   size = 12;
    # };
    settings = {
      scrollback_lines = 15000;
      enable_audio_bell = false;
      update_check_interval = 0;
      repaint_delay = 10;
      input_delay = 1;
      sync_to_monitor = true;
      allow_remote_control = true;
      shell = "${pkgs.zsh}/bin/zsh";
      confirm_os_window_close = 0;
      font_family = "monospace";
      bold_font = "DankMono Nerd Font Mono Bold";
      italic_font = "DankMono Nerd Font Mono Italic";
      bold_italic_font = "DankMono Nerd Font Mono Italic";
      font_size = 12;
    };
    theme = "Rosé Pine";
  };
}
