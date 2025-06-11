{ ... }: {
  #  use later
  services.swaync = {
    enable = true;
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "top";
      cssPriority = "user";
      control-center-margin-top = 22;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;
      notification-icon-size = 64;
      notification-body-image-height = 128;
      notification-body-image-width = 200;
      timeout = 6;
      timeout-low = 3;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 400;
      control-center-height = 915;
      notification-window-width = 375;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [ "title" "dnd" "mpris" "notifications" ];
      widget-config = {
        title = {
          text = " Notification";
          clear-all-button = true;
          button-text = "Clear";
        };
        dnd = { text = " Do Not Disturb"; };
        mpris = {
          image-size = 96;
          image-radius = 4;
        };
        label = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "";
        };
      };
      scripts = {
        example-script = {
          exec = "echo 'Do something...'";
          urgency = "Normal";
        };
      };
      notification-visibility = {
        spotify = {
          state = "enabled";
          urgency = "Low";
          app-name = "Spotify";
        };
        youtube-music = {
          state = "enabled";
          urgency = "Low";
          app-name = "com.github.th_ch.youtube_music";
        };
      };
    };
    style = ''
                @define-color shadow rgba(0, 0, 0, 0.25);
      /*
      *
      * Catppuccin Mocha palette
      * Maintainer: rubyowo
      *
      */

      @define-color base   #1E1D2E;
      @define-color mantle #181825;
      @define-color crust  #11111b;

      @define-color text     #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color subtext1 #bac2de;

      @define-color surface0 #313244;
      @define-color surface1 #45475a;
      @define-color surface2 #585b70;

      @define-color overlay0 #6c7086;
      @define-color overlay1 #7f849c;
      @define-color overlay2 #9399b2;

      @define-color blue      #89b4fa;
      @define-color lavender  #b4befe;
      @define-color sapphire  #74c7ec;
      @define-color sky       #89dceb;
      @define-color teal      #94e2d5;
      @define-color green     #a6e3a1;
      @define-color yellow    #f9e2af;
      @define-color peach     #fab387;
      @define-color maroon    #eba0ac;
      @define-color red       #f38ba8;
      @define-color mauve     #cba6f7;
      @define-color pink      #f5c2e7;
      @define-color flamingo  #f2cdcd;
      @define-color rosewater #f5e0dc;

      @define-color base_lighter  #1e1e2e;
      @define-color mauve_lighter #caa6f7;

      * {
        font-family: "JetBrainsMono Nerd Font";
        background-clip: border-box;
      }

      label {
        color: @text;
      }

      .notification {
        border: none;
        box-shadow: none;
        border-radius: 4px;
        background: inherit;
      }

      .notification button {
        background: transparent;
        border-radius: 0px;
        border: none;
        margin: 0px;
        padding: 0px;
      }

      .notification button:hover {
        /* background: @surface0; */
        background: @insensitive_bg_color;
      }

      .notification-content {
        min-height: 64px;
        margin: 10px;
        padding: 0px;
        border-radius: 0px;
      }

      .close-button {
        background: transparent;
        color: transparent;
      }

      .notification-default-action,
      .notification-action {
        background: transparent;
        border: none;
      }


      .notification-default-action {
        border-radius: 4px;
      }

      /* When alternative actions are visible */
      .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
      }

      .notification-action {
        border-radius: 0px;
        padding: 2px;
        color: @text;
        /* color: @theme_text_color; */
      }

      /* add bottom border radius to eliminate clipping */
      .notification-action:first-child {
        border-bottom-left-radius: 4px;
      }

      .notification-action:last-child {
        border-bottom-right-radius: 4px;
      }

      /*** Notification ***/
      /* Notification header */
      .summary {
        color: @text;
        /* color: @theme_text_color; */
        font-size: 14px;
        padding: 0px;
      }

      .time {
        color: @subtext0;
        font-size: 12px;
        text-shadow: none;
        margin: 0px 0px 0px 0px;
        padding: 2px 0px;
      }

      .body {
        font-size: 14px;
        font-weight: 500;
        color: @subtext1;
        text-shadow: none;
        margin: 0px 0px 0px 0px;
      }

      .body-image {
        border-radius: 4px;
      }

      /* The "Notifications" and "Do Not Disturb" text widget */
      .top-action-title {
        color: @text;
        /* color: @theme_text_color; */
        text-shadow: none;
      }

      /* Control center */

      .control-center {
        background: @crust;
        border: 0px solid @selected;
        box-shadow: 0 0 10px 0 rgba(0,0,0,.80);
        margin: 10px;
        padding: 4px;
      }

      /* .right.overlay-indicator { */
      /*   border: solid 5px red; */
      /* } */

      .control-center-list {
        /* background: @base; */
        background: @crust;
        min-height: 5px;
        /* border: 1px solid @surface1; */
        border-top: none;
      }

      .control-center-list-placeholder,
      .notification-group-icon,
      .notification-group {
        color: @theme_text_color;
      }

      .notification-group {
        /* unset the annoying focus thingie */
        opacity: 0;
        box-shadow: none;
        /* selectable: no; */
      }

      .notification-group > box {
        all: unset;
        background: transparent;
        padding: 4px;
        margin: 0px;
        border: none;
        box-shadow: none;
      }

      .notification-row {
        outline: none;
        transition: all 1s ease;
        background: @mantle;
        border: 0px solid @crust;
        margin: 10px 5px 0px 5px;
      }

      .notification-row:focus,
      .notification-row:hover {
        box-shadow: none;
      }

      .control-center-list > row,
      .control-center-list > row:focus,
      .control-center-list > row:hover {
        background: transparent;
        border: none;
        margin: 0px;
        padding: 5px 10px 5px 10px;
        box-shadow: none;
      }

      .control-center-list > row:last-child {
        padding: 5px 10px 10px 10px;
      }


      /* Window behind control center and on all other monitors */
      .blank-window {
        background: transparent;
      }

      /*** Widgets ***/

      /* Title widget */
      .widget-title {
        margin: 0px;
        background: transparent;
        /* background: @theme_bg_color; */
        /* border: 1px solid @surface1; */
        border-bottom: none;
      }

      .widget-title > label {
        margin: 18px 10px;
        font-size: 16px;
        font-weight: 500;
      }

      .widget-title > button {
        font-weight: 700;
        padding: 4px 8px;
        margin-right: 10px;
        background: transparent;
        color: @text;
        border: none;
      }
      .widget-title > button:hover {
        background: @base;
      }

      /* Label widget */
      .widget-label {
        margin: 0px;
        padding: 0px;
        min-height: 5px;
        background: @mantle;
        border-top: none;
      }
      .widget-label > label {
        font-size: 15px;
        font-weight: 400;
      }

      /* Menubar */
      .widget-menubar {
        background: transparent;
        /* background: @theme_bg_color; */
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none;
      }
      .widget-menubar > box > box {
        margin: 5px 10px 5px 10px;
        min-height: 40px;
        background: transparent;
      }
      .widget-menubar > box > box > button {
        background: @mantle;
        min-width: 185px;
        min-height: 50px;
        margin-right: 10px;
        font-size: 14px;
        padding: 0px;
      }
      .widget-menubar > box > box > button:nth-child(2) {
        margin-right: 0px;
      }
      .widget-menubar button:focus {
        box-shadow: none;
      }
      .widget-menubar button:focus:hover {
        background: @base;
        box-shadow: none;
      }

      .widget-menubar > box > revealer > box {
        margin: 5px 10px 5px 10px;
        background: @mantle;
      }
      .widget-menubar > box > revealer > box > button {
        background: transparent;
        min-height: 50px;
        padding: 0px;
        margin: 5px;
      }

      /* Buttons grid */
      .widget-buttons-grid {
        /* background-color: @theme_bg_color; */
        background: transparent;
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none;
        font-size: 14px;
        font-weight: 500;
        margin: 0px;
        padding: 5px;
        border-radius: 0px;
      }

      .widget-buttons-grid > flowbox > flowboxchild {
        background: @mantle;
        border-radius: 4px;
        min-height: 50px;
        min-width: 85px;
        margin: 5px;
        padding: 0px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        background: transparent;
        border-radius: 4px;
        margin: 0px;
        border: none;
        box-shadow: none;
      }


      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: @mantle;
      }

      /* Mpris widget */
      .widget-mpris {
        padding: 8px;
        padding-bottom: 15px;
        margin-bottom: -33px;
      }
      .widget-mpris > box {
        padding: 0px;
        margin: -5px 0px -10px 0px;
        padding: 0px;
        border-radius: 4px;
        background: @mantle;
      }
      .widget-mpris > box > button:nth-child(1),
      .widget-mpris > box > button:nth-child(3) {
        margin-bottom: 0px;
      }
      .widget-mpris > box > button:nth-child(1) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
      }
      .widget-mpris > box > button:nth-child(3) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
      }

      .widget-mpris-album-art {
        all: unset;
      }

      /* Player button box */
      .widget-mpris > box > carousel > widget > box > box:nth-child(2) {
        margin: 5px 0px -5px 90px;
      }

      /* Player buttons */
      .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button {
        border-radius: 4px;
      }
      .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button:hover {
        background: currentColor;
      }
      carouselindicatordots {
        opacity: 0;
      }

      .widget-mpris-title {
        color: #eeeeee;
        font-weight: bold;
        font-size: 1.25rem;
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
      }
      .widget-mpris-subtitle {
        color: #eeeeee;
        font-size: 1rem;
        text-shadow: 0px 0px 3px rgba(0, 0, 0, 1);
      }

      .widget-mpris-player {
        border-radius: 0px;
        margin: 0px;
      }
      .widget-mpris-player > box > image {
        margin: 0px 0px -48px 0px;
      }

      .notification-group > box.vertical {
        /* border: solid 5px red; */
        margin-top: 3px
      }

      /* Backlight and volume widgets */
      .widget-backlight,
      .widget-volume {
        background: transparent;
        /* background-color: @crust; */
        /* background-color: @theme_bg_color; */
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none; font-size: 13px;
        font-weight: 600;
        border-radius: 0px;
        margin: 0px;
        padding: 0px;
      }
      .widget-volume > box {
        background: @mantle;
        border-radius: 4px;
        margin: 5px 10px 5px 10px;
        min-height: 50px;
      }
      .widget-volume > box > label {
        min-width: 50px;
        padding: 0px;
      }
      .widget-volume > box > button {
        min-width: 50px;
        box-shadow: none;
        padding: 0px;
      }
      .widget-volume > box > button:hover {
        background: @surface0;
      }
      .widget-volume > revealer > list {
        background: @mantle;
        border-radius: 4px;
        margin-top: 5px;
        padding: 0px;
      }
      .widget-volume > revealer > list > row {
        padding-left: 10px;
        min-height: 40px;
        background: transparent;
      }
      .widget-volume > revealer > list > row:hover {
        background: transparent;
        box-shadow: none;
        border-radius: 4px;
      }
      .widget-backlight > scale {
        background: @mantle;
        border-radius: 0px 4px 4px 0px;
        margin: 5px 10px 5px 0px;
        padding: 0px 10px 0px 0px;
        min-height: 50px;
      }
      .widget-backlight > label {
        background: @surface0;
        margin: 5px 0px 5px 10px;
        border-radius: 4px 0px 0px 4px;
        padding: 0px;
        min-height: 50px;
        min-width: 50px;
      }

      /* DND widget */
      .widget-dnd {
        margin: 6px;
        font-size: 16px;
      }

      .widget-dnd > switch {
        background: @mantle;
        font-size: initial;
        border-radius: 8px;
        box-shadow: none;
        padding: 2px;
      }

      .widget-dnd > switch:hover {
        background: @base;
      }

      .widget-dnd > switch:checked {
        background: @base;
      }

      .widget-dnd > switch:checked:hover {
        background: @base;
      }

      .widget-dnd > switch slider {
        background: @mauve;
        border-radius: 6px;
      }

      /* Toggles */
      .toggle:checked {
        background: @surface1;
      }
      /*.toggle:not(:checked) {
        color: rgba(128, 128, 128, 0.5);
      }*/
      .toggle:checked:hover {
        background: @surface2;
      }

      /* Sliders */
      scale {
        padding: 0px;
        margin: 0px 10px 0px 10px;
      }

      scale trough {
        border-radius: 4px;
        background: @surface0;
      }

      scale highlight {
        border-radius: 5px;
        min-height: 10px;
        margin-right: -5px;
      }

      scale slider {
        margin: -10px;
        min-width: 10px;
        min-height: 10px;
        background: transparent;
        box-shadow: none;
        padding: 0px;
      }
      scale slider:hover {
      }

      .right.overlay-indicator {
        all: unset;
      }
    '';
  };
}

