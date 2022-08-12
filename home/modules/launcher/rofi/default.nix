{
  pkgs,
  config,
  lib,
  ...
}:
with lib; {
  options.launcher.rofi = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        If enabled, rofi will be installed.
      '';
    };
  };

  config = mkIf config.launcher.rofi.enable {
    programs.rofi = {
      enable = true;
      font = config.global-fonts.main-family + " 10";
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          bg = mkLiteral config.colors.surface.hex;
          fg = mkLiteral config.colors.text.hex;
          button = mkLiteral config.colors.pine.hex;
          background-color = mkLiteral config.colors.surface.hex;
          text-color = mkLiteral config.colors.text.hex;
        };

        window = {
          border-radius = mkLiteral "5px";
          width = mkLiteral "20%";
          y-offset = mkLiteral "00px";
          padding = mkLiteral "0px 00px 0px 0px";
          location = 0;
        };

        prompt = {
          enabled = false;
        };

        entry = {
          placeholder = "";
          expand = true;
          padding = mkLiteral "5px 5px 5px 5px";
          background-color = mkLiteral config.colors.surface.hex;
          placeholder-color = mkLiteral config.colors.surface.hex;
          text-color = mkLiteral config.colors.text.hex;
          font = "monospace black 10";
        };

        inputbar = {
          children = map mkLiteral ["prompt" "entry"];
          background-color = mkLiteral config.colors.surface.hex;
          text-color = mkLiteral config.colors.text.hex;
          expand = false;
          border-radius = mkLiteral "5px";
          padding = mkLiteral "5px";
          font = "monospace black 10";
        };

        listview = {
          columns = 1;
          lines = 12;
          cycle = true;
          dynamic = false;
          layout = mkLiteral "vertical";
        };

        mainbox = {
          children = map mkLiteral ["inputbar" "listview"];
          spacing = mkLiteral "0px";
          padding = mkLiteral "0px 0px 0px 0px";
        };

        element = {
          orientation = mkLiteral "vertical";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "5px 5px 5px 5px";
          text-color = mkLiteral config.colors.subtle.hex;
          margin = mkLiteral "5px";
        };

        element-text = {
          expand = true;
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "5px 5px 5px 5px";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          font = "monospace 10";
        };

        "selected" = {
          background-color = mkLiteral config.colors.pine.hex;
          text-color = mkLiteral config.colors.surface.hex;
          border-radius = mkLiteral "5px";
          margin = mkLiteral "5px";
          font = "monospace Black 10";
        };
      };
      package = pkgs.rofi-wayland;
    };
    home.packages = with pkgs; [
      rofi-rbw # for password management
    ];
  };
}
