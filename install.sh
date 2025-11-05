#!/bin/bash
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
  gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
  pipewire-audio \
  gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
  xdg-desktop-portal-hyprland xdg-user-dirs \
  polkit-gnome gnome-keyring \
  noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd \
  base-devel flatpak zip unzip unrar mpv imv vim \
  hyprland hyprpaper waybar materia-gtk-theme pavucontrol thunar gvfs kitty xed
command -v yay &>/dev/null || (cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd "$HOME" && rm -rf /tmp/yay)
yay -S --needed --noconfirm hyprshot tofi zen-browser-bin
cp ~/desktop/.bashrc ~/.bashrc
mkdir -p ~/.config
cp -r ~/desktop/.config/* ~/.config/
mkdir -p ~/Imagens
cp -r ~/desktop/Wallpapers ~/Imagens/
xdg-user-dirs-update
sudo pacman -Scc --noconfirm
echo -e "\n\033[1;32mInstalação concluída. Por favor, reinicie o sistema.\033[0m"
