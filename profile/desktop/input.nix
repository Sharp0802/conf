{ ... }:
{
  services.libinput.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "kime";
      kime.iconColor = "White";
    };
  };

  environment.variables = {
    GTK_IM_MODULE = "kime";
    QT_IM_MODULE = "kime";
  };
}
