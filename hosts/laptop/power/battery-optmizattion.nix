{
  powerManagement = {
    enable = true;
    powertop.enable =true;
  };

  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT="powersave";
        CPU_SCALING_GOVERNOR_ON_AC="performance";

        # The following prevents the battery from charging fully to
        # preserve lifetime. Run `tlp fullcharge` to temporarily force
        # full charge.
        # https://linrunner.de/tlp/faq/battery.html#how-to-choose-good-battery-charge-thresholds
        START_CHARGE_THRESH_BAT0=20;
        STOP_CHARGE_THRESH_BAT0=80;

        # 100 being the maximum, limit the speed of my CPU to reduce
        # heat and increase battery usage:
        # CPU_MAX_PERF_ON_AC=75;
        # CPU_MAX_PERF_ON_BAT=60;
      };
    };

    auto-cpufreq = {
      enable = true; 
      settings = {
        turbo = auto;
        governor = powersave;

      };
    };


    upower = {
      enable = true;
      usePercentageForPolicy = true;
      percentageLow = 20;
      percentageCritical = 10;
      percentageAction = 5;
      criticalPowerAction = HybridSleep;
    };

    power-profiles-daemon.enable = true;
    networking.networkmanager.wifi.powersave = true;
  };
  #systemd.services.auto-cpufreq.wantedBy = [ "default.target" ]; # uncomment if auto-cpufreq is dead/inactive at boot
};