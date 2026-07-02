{ inputs, pkgs, ... }:

let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-tools
        hyprland-pkgs.mesa
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };

    cpu.amd.updateMicrocode = true;

    enableRedistributableFirmware = true;
    firmware = with pkgs; [ linux-firmware ];

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  services = {
    fstrim.enable = true;
    blueman.enable = true;
  };

  boot = {
    kernelModules = [ "amdgpu" ];
    kernelParams = [ "amdgpu.sg_display=0" ];
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    libva-utils
    mesa-demos
  ];
}
