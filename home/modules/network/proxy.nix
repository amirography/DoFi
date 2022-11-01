{
  pkgs,
  lib,
  config,
  ...
}: let
  configData =
    pkgs.writeTextFile
    {
      name = "config.json";
      text = builtins.toJSON {
        "local_port" = 1080;
        "local_address" = "127.0.0.1";
      };
      destination = "";
    };
in
  with lib; {
    options = {
      proxy.enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
    config = mkIf config.proxy.enable {
      home.packages = with pkgs; [
        clash # for networking #TODO
        shadowsocks-rust
        proxychains-ng
        chisel
        v2ray
        v2ray-geoip
        shadowsocks-v2ray-plugin
      ];

      # home.file = {
      #   # ".config/shadowsocks/config.json" = {
      #   #   source = ./shadowsocks.json;
      #   # };
      # };

      home.file = {
        ".config/shadowsocks/config.json" = {
          source = configData;
        };
      };

      home.file = {
        ".proxychains/proxychains.conf" = {
          source = ./proxychains.conf;
        };
      };
    };
  }
