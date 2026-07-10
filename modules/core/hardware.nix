{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen5
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vulkan-loader
        vulkan-tools
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
