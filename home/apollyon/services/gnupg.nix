{ config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSshSupport = true;
    enableZshIntegration = true;
  };
}
