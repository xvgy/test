# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let
   # unpkgs = import <nixpkgs-unstable> { }; # Need to manually add channel to use this
   unpkgs-chan-gh =  "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz";
   unpkgs = import (fetchTarball unpkgs-chan-gh) { };
in

{
  imports =
    [ 
      ./hardware-configuration.nix  # results of the hardware scan. (mandatory)
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # time zone.
  time.timeZone = "Asia/Yerevan";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

   console = {
     font = "Lat2-Terminus16";
     useXkbConfig = true; # use xkb.options in tty.
   };

  # X11 windowing system.
  services = {
    displayManager.defaultSession = "none+i3";
    xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "";
      };
      displayManager = { lightdm.enable = true; };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          rofi-unwrapped i3status i3lock i3blocks
          rxvt-unicode-unwrapped xcwd perl feh
        ];
      };
    };
  };
  
  services.printing.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.litter = {
     isNormalUser = true;
     initialPassword = "helloworld";
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = (with pkgs; [   # Dependencies
       diff-so-fancy sd fd gnumake
     ]) ++ (with pkgs; [        # Services
       git stow
       ranger htop
     ]) ++ (with unpkgs; [      # Unstable
       neovim-unwrapped
     ]);
   };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "DejaVuSansMono" "SourceCodePro" "IosevkaTerm" ]; })
  ];

  # VMWare container only
  services.xserver.videoDrivers = [ "vmware" ];
  virtualisation.vmware.guest.enable = true;

  # Do NOT change this value...
  system.stateVersion = "24.05";
}
