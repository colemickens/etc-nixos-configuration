{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  inputs.nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, nixos-unstable }: {

    nixosConfigurations.olimpo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix { self = self; nixpkgs = nixpkgs; nixos-unstable = nixos-unstable; } ];
    };

  };
}
