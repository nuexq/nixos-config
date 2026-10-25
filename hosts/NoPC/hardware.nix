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
      ];
    };

    cpu.amd.updateMicrocode = true;

    enableRedistributableFirmware = true;
    firmware = with pkgs; [
      linux-firmware
    ];

    opentabletdriver.enable = true;
    uinput.enable = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
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
      "amdgpu.dcdebugmask=0x10"
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
