{ inputs, ... }: {
  imports = [
    ./hyprland
    ./zathura
    ./bash
    ./fish
    ./wezterm
    # ./alacritty
    # ./kitty
    ./neofetch
    ./starship
    # ./firefox
    # ./foot
    # ./neovim
    ./anyrun
    ./theme
    ./services
    ./emacs
    ./git
    ./ags
    ./lf
    ./packages.nix
  ] ++ [
    inputs.anyrun.homeManagerModules.default
    inputs.ags.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
  ];
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  programs.home-manager.enable = true;

  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

  home = {
    username = "apollyon";
    homeDirectory = "/home/apollyon";
    stateVersion = "23.05";
  };
}
