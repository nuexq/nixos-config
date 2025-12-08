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
        intel-vaapi-driver 
        libvdpau-va-gl
        libva-vdpau-driver
        vulkan-loader
        vulkan-tools
        hyprland-pkgs.mesa
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };

    cpu.intel.updateMicrocode = true;

    enableRedistributableFirmware = true;
    firmware = with pkgs; [ linux-firmware ];

    # bluetooth = {
    #   enable = true;
    #   powerOnBoot = false;
    # };
  };

  services = {
    fstrim.enable = true;
    thermald.enable = true;

    blueman.enable = true;
  };

  boot = {
    kernelModules = [ "i915" ];
    kernelParams =
      [ "i915.enable_psr=1" "i915.enable_fbc=1" "i915.semaphores=1" ];
  };

  environment.systemPackages = with pkgs; [ vulkan-tools libva-utils mesa-demos ];
}
