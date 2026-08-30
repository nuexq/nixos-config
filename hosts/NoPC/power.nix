{ ... }:
{
  powerManagement.powertop.enable = true;

  services = {
    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    udev.extraRules = ''
      # Disable wakeup from internal keyboard/trackpoint (serio0)
      ACTION=="add", SUBSYSTEM=="serio", DRIVER=="atkbd", ATTR{power/wakeup}="disabled"

      # Disable wakeup from USB and USB-C PD controllers
      ACTION=="add", SUBSYSTEM=="usb", ATTR{power/wakeup}="disabled"
      ACTION=="add", SUBSYSTEM=="pci", ATTR{power/wakeup}="disabled"
    '';

    # tlp = {
    #   enable = true;
    #   settings = {
    #     # EPP (Active mode) uses 'powersave' as a generic pass-through driver.
    #     # The actual performance bias is determined by the ENERGY_PERF_POLICY lines below.
    #     CPU_SCALING_GOVERNOR_ON_AC = "powersave";
    #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    #
    #     CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
    #
    #     # Hardware-level thermal and fan profiles via thinkpad_acpi
    #     PLATFORM_PROFILE_ON_AC = "performance";
    #     PLATFORM_PROFILE_ON_BAT = "low-power";
    #
    #     # Squeeze extra battery life out of the NVMe drive and PCIe bus
    #     PCIE_ASPM_ON_AC = "performance";
    #     PCIE_ASPM_ON_BAT = "powersupersave";
    #
    #     # Optional: Disable CPU turbo boost on battery to keep it dead silent and cool
    #     CPU_BOOST_ON_AC = 1;
    #     CPU_BOOST_ON_BAT = 0;
    #
    #     # Charge thresholds to protect the battery chemistry
    #     STOP_CHARGE_THRESH_BAT0 = 80;
    #     START_CHARGE_THRESH_BAT0 = 75;
    #   };
    # };

  };
  systemd.tmpfiles.rules = [
    "w /sys/class/power_supply/BAT0/charge_control_start_threshold - - - - 75"
    "w /sys/class/power_supply/BAT0/charge_control_end_threshold - - - - 80"
  ];

}
