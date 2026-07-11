let
  args = {
    app = import ../app;
    dev = import ../dev;
    profile = import ../profile;
    user = import ../user;
  };
in
{
  laptop = (import ./laptop) args;
  server = (import ./server) args;
}
