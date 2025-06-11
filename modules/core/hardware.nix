{ inputs, pkgs, ... }:

let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };

    cpu.intel.updateMicrocode = true;

    enableRedistributableFirmware = true;
    firmware = with pkgs; [ linux-firmware ];
  };

  services.fstrim.enable = true;

  services.thermald.enable = true;

  boot.kernelParams = [
    "i915.enable_psr=1"
    "i915.enable_fbc=1"
    "i915.semaphores=1"
  ];
}

