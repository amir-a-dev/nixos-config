{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        width = 10;
        height = 5;
      };
      modules = [
        # ── Hardware ──────────────────────────────────────────────
        {
          type = "custom";
          format = "┌───────────────────── Hardware ─────────────────────┐";
          keyColor = "magenta";
          color = "magenta";
        }
        {
          type = "cpu";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "disk";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "battery";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "host";
          key = "│ ├";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
          keyColor = "magenta";
        }

        "break"

        # ── Software ──────────────────────────────────────────────
        {
          type = "custom";
          format = "┌───────────────────── Software ─────────────────────┐";
          keyColor = "blue";
        }
        {
          type = "os";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "uptime";
          key = "│ ├";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
          keyColor = "blue";
        }
      ];
    };
  };
}
