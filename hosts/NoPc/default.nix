{ pkgs, config, ... }: {
  imports = [ ./hardware-configuration.nix ./../../modules/core ];

  environment.systemPackages = with pkgs; [ acpi powertop xclip lm_sensors bc ];

  services = {
    power-profiles-daemon.enable = false;
    cpupower-gui.enable = true;

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
        # CPU prefrences
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

        # No CPU turbo boost
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        # Disable HWP dyanic boost
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        # System profiles
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # Intel GPU min freq: allowing lowest on AC/battery
        INTEL_GPU_MIN_FREQ_ON_AC = 0;
        INTEL_GPU_MIN_FREQ_ON_BAT = 0;

        # PCIe power saving
        PCIE_ASPM_ON_AC = "performance";
        PCIE_ASPM_ON_BAT = "powersupersave";

        # STOP charging at 80%
        STOP_CHARGE_THRESH_BAT0 = 80;
        # START charging when battery drops below, say, 75%.
        START_CHARGE_THRESH_BAT0 = 75;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      };
    };
  };

  boot = {
    kernelModules = [ "acpi_call" "coretemp" "thinkpad_acpi" ];
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  };
}

