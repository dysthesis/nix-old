{pkgs, ...}: {
  # We need tpm2 for LUKS unlocking
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
    abrmd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    tpm2-tss
  ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/ba2332d4-7815-4a37-ae9c-04e0d55fde19";
      preLVM = true;
      allowDiscards = true;
    };

    # backup = {
    # device = "/dev/disk/by-uuid/86e97a24-8276-466e-9159-640a4f55a6f8";
    # allowDiscards = true;
    # preLVM = true;
    # crypttabExtraOpts = ["tpm2-device=auto"];
    # };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_1TB_S5GXNF0W187823Z-part2";
      randomEncryption = {
        enable = true;
        allowDiscards = true;
      };
    }
  ];

  fileSystems = {
    "/" = {
      device = "none";
      fsType = "tmpfs";
      options = ["defaults" "size=2G" "mode=755"];
    };

    "/nix" = {
      device = "styx/nixos/nix";
      fsType = "zfs";
    };

    "/nix/persist" = {
      device = "styx/nixos/persist";
      fsType = "zfs";
      neededForBoot = true;
    };

    "/home/apollyon" = {
      device = "styx/home/apollyon";
      fsType = "zfs";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/DA2B-BC2E";
      fsType = "vfat";
    };
  };
}
