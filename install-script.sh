#!/bin/bash

# Atualização e instalação de pacotes
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
  gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
  pipewire-audio \
  gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
  xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-utils polkit-kde-agent gnome-keyring \
  xdg-user-dirs xdg-user-dirs-gtk \
  noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-firacode-nerd ttf-jetbrains-mono-nerd \
  git base-devel flatpak zip unzip unrar mpv imv btop fastfetch pavucontrol kitty hyprland hyprpaper waybar nvim firefox

# Instalação do yay se necessário
command -v yay &>/dev/null || (
  cd /tmp &&
    git clone https://aur.archlinux.org/yay.git &&
    cd yay &&
    makepkg -si --noconfirm &&
    cd "$HOME" &&
    rm -rf /tmp/yay
)

# Instalação de pacotes AUR
yay -S --needed --noconfirm hyprshot tofi

# Atualização dos diretórios do usuário
xdg-user-dirs-update

# Cache de fontes
fc-cache -rv

# Limpeza do cache do pacman
sudo pacman -Scc --noconfirm

# Substitui o .bashrc do sistema pelo do repositório
cp ~/desktop/.bashrc ~/.bashrc

# Copia o conteúdo da .config do repositório para dentro da .config do sistema, sobrescrevendo arquivos existentes
mkdir -p ~/.config
cp -r ~/desktop/.config/* ~/.config/

# Copia a pasta Wallpapers para Imagens, sobrescrevendo se já existir
mkdir -p ~/Imagens
cp -r ~/desktop/Wallpapers ~/Imagens/

# Mensagem final
echo -e "\n\033[1;32mInstalação concluída. Por favor, reinicie o sistema.\033[0m"
