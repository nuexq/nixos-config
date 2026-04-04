{ inputs, config, ... }:
let
  userName = builtins.head (builtins.attrNames config.users.users);
  txt = "#2c2520";
in
{
  imports = [ inputs.silentSDDM.nixosModules.default ];

  programs.silentSDDM = {
    enable = true;
    theme = "default-left";

    backgrounds = {
      "pochita" = ../../assets/wallpapers/pochita.mp4;
    };

    profileIcons = {
      "${userName}" = ../../assets/pfp.jpg;
    };

    settings = {
      "LoginScreen" = {
        background = "pochita.mp4";
      };
      "LockScreen" = {
        background = "pochita.mp4";
      };

      "LockScreen.Clock" = {
        color = txt;
      };
      "LockScreen.Date" = {
        color = txt;
      };
      "LockScreen.Message" = {
        color = txt;
      };

      "LoginScreen.LoginArea.Username" = {
        color = txt;
      };
      "LoginScreen.LoginArea.Spinner" = {
        color = txt;
      };
      "LoginScreen.LoginArea.WarningMessage" = {
        normal-color = txt;
      };

      "LoginScreen.LoginArea.Avatar" = {
        active-border-color = txt;
        inactive-border-color = txt;
      };

      "LoginScreen.LoginArea.PasswordInput" = {
        content-color = txt;
        border-color = txt;
        border-radius-left = 0;
        border-radius-right = 0;
        background-color = txt;
        background-opacity = 0.15;
      };

      "LoginScreen.LoginArea.LoginButton" = {
        content-color = txt;
        active-content-color = txt;
        border-color = txt;
        border-radius-left = 0;
        border-radius-right = 0;
        background-color = txt;
        background-opacity = 0.15;
        active-background-color = txt;
        active-background-opacity = 0.3;
      };

      "LoginScreen.MenuArea.Buttons" = {
        border-radius = 0;
      };

      "LoginScreen.MenuArea.Popups" = {
        content-color = txt;
        active-content-color = txt;
        border-color = txt;
        border-radius = 0;
        background-color = txt;
        background-opacity = 0.15;
        active-option-background-color = txt;
        active-option-background-opacity = 0.3;
      };

      "LoginScreen.MenuArea.Session" = {
        content-color = txt;
        active-content-color = txt;
      };
      "LoginScreen.MenuArea.Layout" = {
        content-color = txt;
        active-content-color = txt;
      };
      "LoginScreen.MenuArea.Keyboard" = {
        content-color = txt;
        active-content-color = txt;
      };
      "LoginScreen.MenuArea.Power" = {
        content-color = txt;
        active-content-color = txt;
      };

      "LoginScreen.VirtualKeyboard" = {
        key-content-color = txt;
        selection-content-color = txt;
        border-size = 0;
        background-color = txt;
        background-opacity = 0.15;
        key-active-background-color = txt;
        key-active-opacity = 0.3;
      };

      "Tooltips" = {
        content-color = txt;
        border-radius = 0;
        background-color = txt;
        background-opacity = 0.15;
      };
    };
  };
}
