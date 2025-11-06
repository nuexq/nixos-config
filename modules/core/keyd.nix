{ ... }: {
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overload(hyper, esc)";
          esc = "capslock";
        };
        hyper = {
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        };
      };
      extraConfig = "[hyper:C-M-S-A]";
    };
  };
}

