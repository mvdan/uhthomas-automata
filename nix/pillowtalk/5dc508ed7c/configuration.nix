{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    defaultGateway = "10.0.0.1";
    nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];
    bonds.bond0 = {
      interfaces = [ "enp6s0f0" "enp6s0f1" ];
      driverOptions = {
        lacp_rate = "fast";
        miimon = "100";
        mode = "802.3ad";
        xmit_hash_policy = "layer3+4";
      };
    };
    interfaces = {
      bond0.ipv4.addresses = [{
        address = "10.0.0.2";
        prefixLength = 24;
      }];
      eno1.useDHCP = true;
      eno2.useDHCP = true;
      eno3.useDHCP = true;
      eno4.useDHCP = true;
    };
  };

  system.stateVersion = "20.09";

  # services.kubernetes = {
  #   roles = [ "master" "node" ];
  #   masterAddress = "api.kube";
  #   apiserverAddress = "https://api.kube:6443";
  #   easyCerts = true;
  #   apiserver = {
  #     securePort = 6443;
  #     advertiseAddress = "10.0.0.2";
  #   };
  #   addons.dns.enable = true;
  # };
}
