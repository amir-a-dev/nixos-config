{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      wallpaper = [
        {
          monitor = "eDP-1";
          path = "/etc/nixos/assets/wp5692890.jpg";
          fit_mode = "cover";
        }
      ];
    };
  };
}
