{ inputs, pkgs, ... }:

let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        libvdpau-va-gl
        vaapiVdpau
        vulkan-loader
        vulkan-tools
        hyprland-pkgs.mesa
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        vaapiIntel
      ];
    };

    cpu.intel.updateMicrocode = true;

    enableRedistributableFirmware = true;
    firmware = with pkgs; [ linux-firmware ];
  };

  services.fstrim.enable = true;

  services.thermald.enable = true;

  boot = {
    kernelModules = [ "i915" ];
    kernelParams =
      [ "i915.enable_psr=1" "i915.enable_fbc=1" "i915.semaphores=1" ];
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    libva-utils
    glxinfo
  ];
}

