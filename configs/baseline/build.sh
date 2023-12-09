#!/bin/bash

set -euo pipefail

readonly CWD="$(cd "$(dirname "$0")" && pwd)"

function main {
  local packages=(
    amd-ucode
    base
    base-devel
    bat
    bat-extras
    bluez
    bottom
    breeze
    chromium
    dmenu
    dog
    dust
    fd
    feh
    fuse-overlayfs
    git-delta
    gping
    grub
    i3
    intel-ucode
    julia
    kde-applications
    kitty
    linux-firmware
    linux-zen
    lsd
    micro
    networkmanager
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    obs-studio
    ollama
    plasma
    podman
    procs
    sd
    sddm
    sudo
    ttf-jetbrains-mono-nerd
    xorg-drivers
    xorg-server
  )

  local cachedir="$CWD/cachedir"
  local dbpath="$CWD/dbpath"
  mkdir -p "$dbpath"
  pacman --cachedir "$cachedir" --noconfirm -Swyb "$dbpath" "${packages[@]}"

  local pkgs="$CWD/airootfs/.pkgs"
  cp -r "$cachedir" "$pkgs"

  local db="$pkgs/live.db.tar.gz"
  find "$pkgs" -regex '.*\(\.pkg\.tar\.xz\|\.pkg\.tar\.zst\)$' | xargs repo-add "$db"

  mkarchiso "$@"
}

main "$@"
