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
        "hyper:C-M-S-A" = {
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        };
      };
    };
  };
}

