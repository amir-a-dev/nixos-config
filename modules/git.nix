{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      # Use 'alias' instead of 'aliases'
      alias = {
        lg = "log --color --graph";
      };
      user = {
        name = "amir-a-dev";
        email = "178704215+amir-a-dev@users.noreply.github.com";
      };
      # Move everything from extraConfig here
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
