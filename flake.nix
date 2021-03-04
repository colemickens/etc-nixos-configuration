{
  description = "hhefesto's system configuration";

  # inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  # inputs.unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ self, nixpkgs, ... }:
    # let
    #   system = "x86_64-linux";
    #   inherit (inputs.nixpkgs) lib;
    #   overlays = {
    #     unstable = final: prev: {
    #       unstable = (import inputs.unstable {
    #         inherit system;
    #       });
    #     # pkg-sets = (
    #     #   final: prev: {
    #     #     unstable = import inputs.unstable { system = final.system; };
    #     #   }
    #     # );
    #     };
    #   };

    # in
      {

    nixosConfigurations.Olimpo = nixpkgs.lib.nixosSystem {
      # inherit system;
      system = "x86_64-linux";
      # modules = [ ./configuration.nix { self1 = self; nixpkgs = nixpkgs; } ];
      modules =
        [ (import ./configuration.nix)
          # ({ pkgs, ... }: {
          #   nixpkgs.overlays = [
          #     (final: prev: {
          #       unstable = import unstable { system = final.system; };
          #     })
          #   ];

          #   })
          # { nixpkgs.overlays = [ overlays.unstable ];
          #     system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev; }
          #
          # ({ config, pkgs, ... }:
          #     let
          #       overlay-unstable = final: prev: {
          #         # unstable = import inputs.unstable { system = final.system; };
          #         unstable = inputs.unstable.legacyPackages.x86_64-linux;
          #       };
          #     in
          #       {
          #         nixpkgs.overlays = [ overlay-unstable ];
          #         # environment.systemPackages = with pkgs; [
          #         #   # unstable.qutebrowser
          #         #   unstable.zoom-us
          #         # ];
          #       }
          #   )
        ];
      specialArgs = { inherit inputs; };
    };

  };
}
