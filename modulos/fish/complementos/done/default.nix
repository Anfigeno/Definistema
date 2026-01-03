{ pkgs, ... }:
{
  paquete = {
    name = "done";
    src = pkgs.fetchFromGitHub {
      owner = "franciscolourenco";
      repo = "done";
      rev = "998ad4f5fc9cee36c09840a7e635b56428e554f9";
      sha256 = "sha256-GZ1ZpcaEfbcex6XvxOFJDJqoD9C5out0W4bkkn768r0=";
    };
  };
}
