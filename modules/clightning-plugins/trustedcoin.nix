{ config, lib, pkgs, ... }:

with lib;
let
#  inherit (config.services) bitcoind;
  cfg = config.services.clightning.plugins.trustedcoin;
in
{
  options.services.clightning.plugins.trustedcoin = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Whether to enable trustedcoin (clightning plugin).
        See also: https://github.com/fiatjaf/trustedcoin#the-trustedcoin-plugin
      '';
    };
    package = mkOption {
      type = types.package;
      default = config.nix-bitcoin.pkgs.trustedcoin;
      defaultText = "config.nix-bitcoin.pkgs.trustedcoin";
      description = "The package providing trustedcoin binaries.";
    };
  };

  config = mkIf cfg.enable {
#    services.bitcoind = {
#      rpc.users.trustedcoin = {
#        passwordHMACFromFile = true;
#        rpcwhitelist = bitcoind.rpc.users.public.rpcwhitelist;
#      };
#    };
    services.clightning.extraConfig = ''
      plugin=${cfg.package}/bin/trustedcoin
      disable-plugin=bcli
    '';
  };
}
