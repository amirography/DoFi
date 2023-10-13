{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  options.yazi.enable = mkEnableOption "yazi";

  config = mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      keymap = {};
      settings = {};
    };
  };
}
