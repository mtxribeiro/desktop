#!/bin/bash
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
  gstreamer gst-plugins-{base,good,bad,ugly} gst-libav \
  pipewire-audio \
  gtk{3,4} qt{5,6}-wayland xorg-xwayland \
  xdg-desktop-portal-hyprland xdg-user-dirs \
  polkit-gnome gnome-keyring \
  noto-fonts{,-emoji,-cjk} ttf-liberation ttf-jetbrains-mono-nerd \
  base-devel flatpak zip unzip unrar mpv imv vim pavucontrol \
  hyprland hyprpaper waybar materia-gtk-theme kitty pcmanfm gvfs
command -v yay &>/dev/null || (cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm)
yay -S --needed --noconfirm hyprshot tofi zen-browser-bin
cp ~/desktop/.bashrc ~/.bashrc
mkdir -p ~/.config
cp -r ~/desktop/.config/* ~/.config/
mkdir -p ~/Imagens
cp -r ~/desktop/Wallpapers ~/Imagens/
xdg-user-dirs-update
sudo pacman -Scc --noconfirm
echo -e "\n\033[1;32mInstalação concluída. Por favor, reinicie o sistema.\033[0m"
