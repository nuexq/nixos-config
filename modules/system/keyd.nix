{ ... }: {
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overloadt(hyper, esc, 150)";
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

