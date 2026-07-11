{ pkgs, ... }:
{
  fonts.enableDefaultPackages = false;
  fonts.packages = with pkgs; [
    # monospace
    jetbrains-mono
    sarasa-gothic

    # sans-serif
    noto-fonts-cjk-sans
    pretendard
    pretendard-jp

    # serif
    hahmlet
    noto-fonts-cjk-serif

    # emoji
    noto-fonts-color-emoji
  ];
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      monospace = [
        "JetBrains Mono"
        "Sarasa Mono K"
        "Sarasa Mono J"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Pretendard"
        "Pretendard JP"
        "Noto Sans CJK KR"
        "Noto Sans CJK JP"
        "Noto Color Emoji"
      ];
      serif = [
        "Hahmlet"
        "Noto Serif CJK KR"
        "Noto Serif CJK JP"
        "Noto Color Emoji"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };

    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
  };
}
