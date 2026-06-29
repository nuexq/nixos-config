{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.systemPackages = with pkgs; [
    acpi
    xclip
    lm_sensors
    bc
  ];

  services.fwupd.enable = true;

  services = {
    power-profiles-daemon.enable = false;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    tlp = {
      enable = true;
      settings = {
        # EPP (Active mode) uses 'powersave' as a generic pass-through driver.
        # The actual performance bias is determined by the ENERGY_PERF_POLICY lines below.
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        # Hardware-level thermal and fan profiles via thinkpad_acpi
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # Squeeze extra battery life out of the NVMe drive and PCIe bus
        PCIE_ASPM_ON_AC = "performance";
        PCIE_ASPM_ON_BAT = "powersupersave";

        # Optional: Disable CPU turbo boost on battery to keep it dead silent and cool
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        # Charge thresholds to protect the battery chemistry
        STOP_CHARGE_THRESH_BAT1 = 80;
        START_CHARGE_THRESH_BAT1 = 75;
      };
    };
  };

  # zramSwap = {
  #   enable = true;
  #   memoryPercent = 50;
  #   algorithm = "zstd";
  #   priority = 100;
  # };

  boot = {
    kernelModules = [
      "thinkpad_acpi"
    ];
    kernelParams = [ "amd_pstate=active" ];
  };
}
