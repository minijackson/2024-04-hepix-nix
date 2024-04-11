{
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  users.users.root.initialPassword = "hello-hepix";

  system.stateVersion = "23.11";
  nixpkgs.hostPlatform = "x86_64-linux";
}
