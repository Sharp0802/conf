{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = [
      {
        init.defaultBranch = "main";
        credential.helper = "oo7";
        pull.rebase = true;
        rebase.autoStash = true;
        rerere.enabled = true;
      }
    ];
  };
}
