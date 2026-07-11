{ lib, ... }:
let
  args = {
    app = import ../app { inherit lib; };
    dev = import ../dev { inherit lib; };
    profile = import ../profile { inherit lib; };
    user = import ../user { inherit lib; };
  };
in
{
  laptop = (import ./laptop) args;
  server = (import ./server) args;
}
