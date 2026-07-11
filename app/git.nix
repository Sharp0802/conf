{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = [
      {
        init.defaultBranch = "main";
        credential.helper = "store";
        pull.rebase = true;
        rebase.autoStash = true;
        rerere.enabled = true;
      }
    ];
  };
}
