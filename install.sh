#!/bin/bash

set -eu

echo "


  _/      _/    _/_/    _/_/_/  _/_/_/
 _/      _/  _/    _/    _/    _/    _/
_/      _/  _/    _/    _/    _/    _/
 _/  _/    _/    _/    _/    _/    _/
  _/        _/_/    _/_/_/  _/_/_/



    _/        _/_/_/  _/      _/  _/    _/  _/      _/
   _/          _/    _/_/    _/  _/    _/    _/  _/
  _/          _/    _/  _/  _/  _/    _/      _/
 _/          _/    _/    _/_/  _/    _/    _/  _/
_/_/_/_/  _/_/_/  _/      _/    _/_/    _/      _/



    _/_/_/  _/      _/    _/_/_/  _/_/_/_/_/    _/_/    _/        _/
     _/    _/_/    _/  _/            _/      _/    _/  _/        _/
    _/    _/  _/  _/    _/_/        _/      _/_/_/_/  _/        _/
   _/    _/    _/_/        _/      _/      _/    _/  _/        _/
_/_/_/  _/      _/  _/_/_/        _/      _/    _/  _/_/_/_/  _/_/_/_/



      _/_/_/    _/_/_/  _/_/_/    _/_/_/  _/_/_/    _/_/_/_/_/
   _/        _/        _/    _/    _/    _/    _/      _/
    _/_/    _/        _/_/_/      _/    _/_/_/        _/
       _/  _/        _/    _/    _/    _/            _/
_/_/_/      _/_/_/  _/    _/  _/_/_/  _/            _/


"

echo "Make sure that you have already gone through the void-installer script provided by Void Linux."

echo "This script will install and configure a bunch of packages that I use for my usual setup."

echo ""

echo "Do you want to continue? (y/n)" ; read answer

echo ""

if [ "$answer" != "${answer#[Yy]}" ] ; then
    echo "Continuing..."
else
    echo "Exiting..."
    exit
fi

echo ""

echo "Updating package repositories and installing packages."

sudo xbps-install -SAu

sudo xbps-install -SAu void-repo-nonfree void-updates void-repo-multilib void-repo-multilib-nonfree

# To get the package list: xpkg -m | xargs -n 1 | xsel -b
sudo xbps-install -SAu \
7zip-unrar \
CPU-X \
Ghidrathon \
GraphicsMagick \
ImageMagick \
MangoHud \
Minder \
MultiMarkdown \
PopCorn \
RcloneBrowser \
SDL \
SDL2-devel \
SDL2_ttf \
SDL2_ttf-devel \
SDL_image \
SFML \
SFML-devel \
Signal-Desktop \
SoapyAirspy \
SoapyHackRF \
SoapyLMS7 \
SoapyRTLSDR \
SoapyUHD \
Solaar \
VirtualGL \
Vulkan-Headers \
Vulkan-Tools \
Vulkan-ValidationLayers \
acpi \
acpi_call-dkms \
adwaita-qt \
aircrack-ng \
alacritty \
alsa-firmware \
alsa-lib-devel \
alsa-pipewire \
alsa-plugins \
alsa-plugins-ffmpeg \
alsa-plugins-samplerate \
alsa-tools \
alsa-tools-devel \
alsa-utils \
alsaequal \
amdvlk \
amdvlk-32bit \
amfora \
android-file-transfer-linux \
android-udev-rules \
ansible \
arc-icon-theme \
arc-theme \
ardour \
arduino-cli \
aria2 \
arp-scan \
arpfox \
artwiz-fonts \
ascii \
asciinema \
aspell \
aspell-en \
atool \
attr-devel \
audacious \
audacious-plugins \
autofs \
base-devel \
base-system \
bash-language-server \
bat \
binfmt-support \
blender \
blueman \
bluez \
bombardier \
bridge-utils \
brother-brlaser \
bsdtar \
bsdunzip \
btop \
cairomm-devel \
cargo \
catdoc \
catgirl \
ccls \
chromium \
clamav \
clang \
clang-analyzer \
cloc \
cmake \
cmark \
cmark-gfm \
cmatrix \
console-setup \
croc \
cronie \
cryptsetup \
cups \
cups-devel \
cups-filters \
cups-pdf \
curl \
cutter \
czkawka \
dcadec \
ddcutil \
dfc \
dina-font \
dino \
dmenu \
dragon \
dumb_runtime_dir \
dunst \
earlyoom \
easyeffects \
ebook-tools \
edk2-ovmf \
electrum \
evince \
evtest \
exfatprogs \
exiftool \
ext4magic \
extundelete \
fail2ban \
fann \
fbv \
fd \
feh \
ffmpeg \
figlet \
figlet-fonts \
filezilla \
firefox \
flatpak \
foliate \
font-adobe-source-code-pro \
font-awesome \
font-awesome6 \
font-cozette \
font-firacode \
font-inconsolata-otf \
font-iosevka \
font-material-design-icons-ttf \
font-sarasa-gothic \
font-sil-doulos \
font-weather-icons \
fontconfig-doc \
fontforge \
fontmanager \
fonts-croscore-ttf \
fortune-mod \
fortune-mod-anarchism \
fortune-mod-de \
fortune-mod-void \
freecad \
fsv \
fuse-devel \
fuse-sshfs \
fuse3 \
fuse3-devel \
fzf \
gallery-dl \
gamemode \
gcc-fortran \
gcc-go \
gcolor3 \
gdb \
gdu \
geckodriver \
ghc \
ghc-doc \
ghi \
ghidra \
ghostwriter \
giflib-devel \
giflib-tools \
gimp \
git \
github-cli \
gitui \
glava \
glib-devel \
glmark2 \
glxinfo \
gmic-krita \
gnome-themes-extra \
gnuradio \
gnuradio-osmosdr \
go \
go-mtpfs \
godot \
golangci-lint \
gomatrix \
gopls \
gparted \
gperftools \
gperftools-32bit \
gperftools-devel \
gpgme \
groff-doc \
grub-x86_64-efi \
gstreamer-vaapi \
gstreamer1-aravis \
gstreamer1-pipewire \
gstreamermm \
gtk+3-devel \
gtk-engine-murrine-32bit \
gtklp \
gtypist \
hashcat \
hashcat-utils \
hdf5-devel \
hidapi \
highlight \
horst \
hplip \
htop \
hunspell-en \
hunspell-ro_RO \
hydrogen \
i2c-tools \
i2c-tools-32bit \
i2pd \
icdiff \
icu-devel \
imlib2-devel \
imlib2-tools \
imlib2-webp \
inetutils \
inetutils-ifconfig \
inkscape \
inxi \
ipafont-fonts-otf \
jack \
jmtpfs \
jp2a \
jq \
json-c++ \
judy \
judy-devel \
jupyterlab \
kakoune \
keepassxc \
kicad \
kompare \
kotlin-bin \
krfb \
krita \
kvantum \
lagrange \
libX11-devel-32bit \
libXdamage-devel \
libXft-devel \
libXi-32bit \
libXinerama-devel \
libXrandr-32bit \
libXrandr-devel \
libXrandr-devel-32bit \
libXtst-32bit \
libcurl-devel \
libdazzle \
libdca \
libdrm-32bit \
liberation-fonts-ttf \
libexif-devel \
libgcc-32bit \
libgfortran-devel \
libglib-static-32bit \
libglvnd-32bit \
libgo-32bit \
libgo-devel-32bit \
libgomp-32bit \
libgomp-devel \
libgomp-devel-32bit \
libgta \
libgta-devel \
libgtkdgl-32bit \
libgtkdsv-32bit \
libgtkhtml-32bit \
libguestfs \
libinput-gestures \
libjack-pipewire \
libjpeg-turbo \
libopenal-32bit \
libopencv-devel \
libopencv-python3 \
libopencv4 \
libopencv4-devel \
libopencv4-python3 \
libopusenc \
libopusenc-devel \
libpulseaudio-32bit \
libreoffice \
libselinux \
libsixel \
libsixel-devel \
libsixel-util \
libspa-bluetooth \
libspa-jack \
libspa-vulkan \
libspa-vulkan-32bit \
libstdc++-32bit \
libstdc++-devel-32bit \
libva-32bit \
libvdpau-32bit \
libwebp-tools \
libwoff2common1.0.2 \
libwoff2dec1.0.2 \
libwoff2enc1.0.2 \
libxcrypt-compat \
linux-driver-management \
linux-firmware \
linux-lts \
linux-lts-headers \
linux-mainline \
linux-mainline-headers \
linux-tools \
linux-vt-setcolors \
linux6.6 \
linux6.6-headers \
llvm \
lm_sensors \
lolcat-c \
lsd \
lua \
lua-language-server \
luarocks \
lutris \
macchanger \
mandown \
mathjax \
mdp \
mediainfo \
mesa-32bit \
mesa-ati-dri \
mesa-ati-dri-32bit \
mesa-demos \
mesa-dri-32bit \
mesa-opencl-32bit \
mesa-vulkan-intel \
mesa-vulkan-intel-32bit \
mesa-vulkan-overlay-layer \
mesa-vulkan-overlay-layer-32bit \
mesa-vulkan-radeon \
mesa-vulkan-radeon-32bit \
meson \
mokutil \
mosh \
mpv \
mpv-mpris \
mtools \
mupdf \
nasm \
ncurses-devel \
ncurses-libtinfo-devel \
ncurses-libtinfo-libs \
nemesis \
neofetch \
neomutt \
neovim \
nerd-fonts \
netbsd-wtf \
newsboat \
nfs-utils \
nginx \
nicotine+ \
nix \
nmap \
noto-fonts-cjk \
noto-fonts-emoji \
ntfs-3g \
nv-codec-headers \
nvidia \
nvidia-libs-32bit \
nvidia-opencl \
nvtop \
obs \
octave \
openblas-devel \
openbsd-netcat \
opencv \
opencv4 \
openjdk \
openjdk-jre \
openjdk17 \
opus-tools \
outguess \
p7zip \
pandoc \
pango-devel \
pango-view \
pangomm-devel \
pass \
pass-otp \
pavucontrol \
pcmanfm \
persepolis \
picom \
pipewire \
pipewire-devel \
pipewire-doc \
pixd \
ponysay \
poppler-qt6 \
powerstat \
powertop \
ppp \
profanity \
protontricks \
pulsemixer \
pyside2-tools \
python3-Markdown \
python3-cairo-devel \
python3-cairocffi \
python3-cchardet \
python3-commonmark \
python3-cycler \
python3-dbus-devel \
python3-devel \
python3-docutils \
python3-glad \
python3-h5py \
python3-html2text \
python3-lsp-server \
python3-markdown-math \
python3-mccabe \
python3-mpv \
python3-mypy \
python3-neovim \
python3-pip \
python3-pipx \
python3-pycodestyle \
python3-pyflakes \
python3-pymediainfo \
python3-smbus \
python3-vint \
python3-virtualenv \
python3-wheel \
qalculate \
qbittorrent \
qemu \
qjackctl \
qpwgraph \
qt5ct \
qt6ct \
qtxdg-tools \
radeontop \
ranger \
rclone \
readline \
readline-devel \
refind \
remmina \
riff \
ripgrep \
rpi-imager \
rsync \
rtkit \
rust \
rust-analyzer \
rust-doc \
rz-ghidra \
rz-ghidra-32bit \
sc-im \
scrcpy \
screen \
screenkey \
scrot \
sent \
signal-backup-decode \
simple-mtpfs \
skim \
smartmontools \
socklog \
socklog-void \
spectrum3d \
speedometer \
starplot \
steam \
stegsnow \
stow \
streamlink \
sublime-text3 \
surf \
sxhkd \
sxiv \
syncthing \
syncthing-discosrv \
syncthing-relaysrv \
taplo \
tectonic \
telegram-desktop \
tesseract-ocr \
tesseract-ocr-eng \
tesseract-ocr-ron \
testdisk \
texlive-BibTeX \
texlive-ConTeXt \
texlive-LuaTeX \
texlive-XeTeX \
texlive-basic \
texlive-most \
texstudio \
texworks \
thunderbird \
timg \
tio \
tk-devel \
tldr \
tlp \
tmux \
torbrowser-launcher \
torsocks \
tree \
tty-clock \
typst \
typst-lsp \
typstfmt \
ueberzug \
unrar \
util-linux \
v4l-utils-32bit \
vde2 \
virt-manager \
virt-viewer \
vkBasalt \
vkBasalt-32bit \
vkQuake \
vkd3d-32bit \
void-docs \
void-docs-browse \
void-repo-multilib \
void-repo-multilib-nonfree \
void-repo-nonfree \
void-updates \
vokoscreen \
vpm \
vscode \
vsv \
w3m \
waifu2x-converter-cpp \
webp-pixbuf-loader \
wget \
whois \
wine \
wine-32bit \
wine-gecko \
wine-mono \
wine-tools \
wineasio \
winetricks \
wireguard-tools \
wireless_tools \
wireplumber \
wireshark \
wireshark-qt \
xautolock \
xbanish \
xclip \
xcolor \
xdg-desktop-portal-gtk \
xdg-user-dirs \
xdg-user-dirs-gtk \
xdg-utils \
xdotool \
xf86-input-joystick \
xf86-input-mtrack \
xmenu \
xmirror \
xorg \
xorg-server-devel \
xoris \
xournal \
xscreensaver \
xsecurelock \
xsel \
xtools \
xxd \
yad \
yggdrasil \
youtube-dl \
yt-dlp \
zathura \
zathura-cb \
zathura-djvu \
zathura-pdf-poppler \
zathura-ps \
zbar \
zbar-qt \
zig \
zip \
zls \
zola \
zoxide \
zsh \
zsh-completions \
zsh-history-substring-search \
zstd \
zulucrypt

echo ""

echo "Increasing max_map_count ..."
sudo sysctl -w vm.max_map_count=1048576
sysctl vm.max_map_count

echo ""

echo "Loading config files for important applications..."

# i will use move, copy, link, etc commands with their verbose options to show what is being done.
