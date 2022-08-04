{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options = {
    kitty.enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      settings = {
        # performance
        scrollback_lines = 15000;
        update_check_interval = 0;
        repaint_delay = 10;
        input_delay = 1;
        sync_to_monitor = true;

        # changing default behaviors
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        allow_remote_control = true;

        # Default shell
        shell = "${pkgs.fish}/bin/fish";

        # Font settings
        font_size = 15;
        adjust_line_height = 13;
        font_family = config.global-fonts.main-family;
        bold_font = config.global-fonts.main-black;
        italic_font = config.global-fonts.main-black;
        bold_italic_font = config.global-fonts.main-black-italic;
      };
      theme = "Rosé Pine"; # the default one is mocha colored, nice choice kitty!
    };
  };
}
