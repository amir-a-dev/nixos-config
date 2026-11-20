{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Cantarell", sans-serif;
        font-size: 13px;
        font-weight: 500;
        min-height: 0;
      }

      window#waybar {
        background: #000000;
        color: #ffffff;
      }

      /* =========================
         Workspaces
         ========================= */

      #workspaces {
        padding: 0 6px;
      }

      #workspaces button {
        padding: 0 9px;
        margin: 3px 2px;
        border-radius: 6px;
        color: #cfcfcf;
        background: transparent;
      }

      #workspaces button.active {
        background: rgba(255, 255, 255, 0.12);
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.08);
      }

      #workspaces button.urgent {
        background: rgba(255, 80, 80, 0.25);
        color: #ff6b6b;
      }

      /* =========================
         Center window title
         ========================= */

      #window {
        color: #eeeeee;
        font-weight: 500;
      }

      /* =========================
         Right side
         ========================= */

      #pulseaudio,
      #battery,
      #clock,
      #tray {
        padding: 0 9px;
        color: #eeeeee;
      }

      #network {
        padding: 0 12px;
        color: #eeeeee;

      }

      #clock {
        font-weight: 600;
      }

      #pulseaudio.muted {
        color: #999999;
      }

      #network.disconnected {
        color: #ff6b6b;
      }

      #battery.warning:not(.charging) {
        color: #f5c542;
      }

      #battery.critical:not(.charging) {
        color: #ff6b6b;
        animation: blink 1s linear infinite;
      }

      #battery.charging {
        color: #8fd694;
      }

      #tray {
        padding-left: 6px;
        padding-right: 8px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }

      @keyframes blink {
        50% {
          opacity: 0.35;
        }
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "window"
        ];

        modules-right = [
          "pulseaudio"
          "network"
          "battery"
          "clock"
          "tray"
        ];

        # =========================
        # Workspaces
        # =========================

        "hyprland/workspaces" = {
          format = "{icon}";

          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";

            urgent = "";
            default = "•";
          };

          all-outputs = true;
          active-only = false;
          disable-scroll = false;

          persistent_workspaces = {
            "*" = 5;
          };

          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        # =========================
        # Active window
        # =========================

        "window" = {
          format = "{}";
          max-length = 50;
          tooltip = false;
        };

        # =========================
        # Audio
        # =========================

        "pulseaudio" = {
          format = "{icon}   {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "󰖁 Muted";

          format-icons = {
            headphone = "󰋋";
            hands-free = "󰋎";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };

          on-click = "pavucontrol";
          tooltip = true;
          tooltip-format = "Volume: {volume}%";
        };

        # =========================
        # Network
        # =========================

        "network" = {
          format-wifi = "    {signalStrength}%";
          format-ethernet = "󰈀";
          format-linked = "󰈀";
          format-disconnected = "󰖪";

          format-alt = "{ifname}: {ipaddr}/{cidr}";

          tooltip-format = "{essid}\nSignal: {signalStrength}%\nIP: {ipaddr}";

          on-click = "nm-connection-editor";
        };

        # =========================
        # Battery
        # =========================

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };

          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";

          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];

          tooltip-format = "{capacity}%\n{time}";
        };

        # =========================
        # Clock
        # =========================

        "clock" = {
          format = "{:%a %d %b  %H:%M}";

          format-alt = "{:%Y-%m-%d %H:%M:%S}";

          tooltip-format = "{:%A, %B %d, %Y}\n{:%H:%M:%S}";
        };

        # =========================
        # System tray
        # =========================

        "tray" = {
          icon-size = 16;
          spacing = 8;
        };
      };
    };
  };
}
