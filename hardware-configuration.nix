# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, nixpkgs, ... }:

{
  imports =
    [ # <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
      # "${nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
    ];

  hardware.enableRedistributableFirmware = lib.mkDefault true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ec18ecbb-1965-4509-95ff-351e79f314de";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BDF6-8189";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/d4fddc87-3846-4b73-94e6-cf250d8affa7"; }
    ];

  nix.maxJobs = lib.mkDefault 16;
}
