{pkgs, ...}: {
  # imports = [
  # ];

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
  programs.rbw.enable = true;
  programs.rbw.settings = {
    email = "amirhossein.alesheikh@gmail.com";
    pinentry = "curses";
  };

  fonts.fontconfig.enable = true;
  gtk.enable = true;
  # gtk.font.name = "Recursive";
  # gtk.font.package = pkgs.recursive;
  # gtk.font.size = 10;

  home.sessionVariables = {
    BW_CLIENTSECRET = "1YnJyztT6fzD0mmvioFlq3jXoJ23Np";
    BW_SESSION = "l4fWgy4H9vCjf9LN8pmqWjfVdXRFrthUyP/KhSuww/AgxwTtkgWDQCwF/vTWOIc2rT9efPizQoJsKZ/kdKYaGQ==";
    PAGER = "less";
    XKB_DEFAULT_LAYOUT = "us,ir";
    XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle,caps:escape";
    QT_QPA_PLATFORM = "wayland";
    LESS = "-g -i -M -R -S -w -X -z-4";
    ZK_NOTEBOOK_DIR = "$HOME/notes";
    MOZ_ENABLE_WAYLAND = 1;
    FAVO_BOOKMARK = "$ZK_NOTEBOOK_DIR/bm.md";
  };
  home.sessionPath = ["$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin"];
}
