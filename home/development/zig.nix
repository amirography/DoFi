{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  options.zig.enable = mkEnableOption "zig settings";

  config = mkIf config.zig.enable {
    home.packages = [
      pkgs.zigpkg
      pkgs.zls
    ];
  };
}
