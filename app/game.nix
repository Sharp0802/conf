{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    prismlauncher
    r2modman
  ];

  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };
}
