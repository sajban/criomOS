{ kor, lib, kriozonz, mkOutputsOfSystem, krioniksRev }:

let
  inherit (builtins) fold attrNames mapAttrs filterAttrs;

  mkNeksysDerivations = priNeksysNeim: kriozon:
    let
      inherit (kriozon) krimynz;
      inherit (kriozon.astra.mycin) ark;
      system = kor.arkSistymMap.${ark};
      outputsOfSystem = mkOutputsOfSystem system;
      inherit (outputsOfSystem) pkgs uyrld;
      hyraizyn = kriozon;

      krimynProfiles = {
        light = { dark = false; };
        dark = { dark = true; };
      };

      mkKrimynHomz = krimynNeim: krimyn:
        let
          mkProfileHom = profileName: profile:
            let homeConfig =
              uyrld.mkHomeConfig
                { inherit kriozon krimyn profile; };
            in homeConfig.home.activationPackage;
        in
        mapAttrs mkProfileHom krimynProfiles;

      mkKrimynImaks = krimynNeim: krimyn:
        let
          inherit (uyrld.pkdjz) meikImaks;
          mkProfileImaks = profileName: profile:
            meikImaks { inherit kriozon krimyn profile; };
        in
        mapAttrs mkProfileImaks krimynProfiles;

    in
    {
      os = mkKrioniks { inherit krioniksRev nixpkgs kor uyrld hyraizyn; };
      hom = mapAttrs mkKrimynHomz krimynz;
      imaks = mapAttrs mkKrimynImaks krimynz;
    };

  mkNeksysDerivationIndex = neksysNeim: neksysPrineksysIndeks:
    mapAttrs mkNeksysDerivations neksysPrineksysIndeks;

in
mapAttrs mkNeksysDerivationIndex kriozonz
