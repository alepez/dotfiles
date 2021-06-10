# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  time.timeZone = "Europe/Rome";

  networking.hostId = "6e656f6e";
  networking.hostName = "neon";
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;
  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver = {
    enable = true;
    layout = "us";

    libinput.enable = true;

    displayManager = {
      defaultSession = "none+i3";
      autoLogin = { enable = true; user = "alepez"; };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        rofi
        dunst
        polybarFull
      ];
    };

  };

  services.printing.enable = true;

  services.openssh.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.alepez = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    uid = 1000;
    shell = pkgs.zsh;
    packages = with pkgs; [
      jetbrains.clion
      rust-analyzer
      rustup
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    blueman
    delta
    docker
    fzf
    git
    gnome.gpaste
    gnome.networkmanagerapplet
    htop
    killall
    libnotify
    pulseaudio-ctl
    nix-index
    nload
    nodejs
    oh-my-zsh
    pass
    pasystray
    picom
    starship
    tmux
    udiskie
    unzip
    wget
    xcape
    xlibs.xmodmap
    zsh
    zsh-autosuggestions
    feh
    xfce.thunar
    betterlockscreen
    silver-searcher
    simple-scan
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    source-sans-pro
    roboto
  ];

  programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.command-not-found.enable = false;

  programs.ssh = {
    extraConfig = ''
      ServerAliveInterval 60
      CheckHostIP no
      Compression no
      ConnectTimeout 15
      Protocol "2"
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    promptInit = "";

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "cargo"
        "common-aliases"
        "dirhistory"
        "docker"
        "history"
        "pass"
        "systemd"
        "tmux"
      ];
    };

    histSize = 65535;
    histFile = "$HOME/.history";

    shellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
      ZSH_TMUX_AUTOSTART=true
      ZSH_TMUX_AUTOCONNECT=false
    '';
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        source ~/.dotfiles/nvim/init.vim
      '';
    };
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05";

}

