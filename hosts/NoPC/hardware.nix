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
    firmware = with pkgs; [
      linux-firmware
    ];

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    opentabletdriver.enable = true;
    uinput.enable = true;
  };

  services = {
    blueman.enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "ntfs" ];

    kernelModules = [
      "amdgpu"
      "thinkpad_acpi"
      "snd_pci_acp6x"
      "uinput"
    ];
    kernelParams = [
      "amdgpu.sg_display=0"
      "amd_pstate=active"
      "thinkpad_acpi.fan_control=1"
    ];
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    libva-utils
    mesa-demos
    acpi
    xclip
    lm_sensors
    bc
  ];
}
