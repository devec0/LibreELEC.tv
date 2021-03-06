################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="moonlight-embedded"
PKG_VERSION="a4b6de1"
PKG_SHA256="54c53f0f6abcd49aadd065e6a5cdd1bff1ca5b8c6461fff2dc220d9465f487ce"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/irtimmer/moonlight-embedded"
PKG_URL="https://github.com/irtimmer/moonlight-embedded/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain curl libcec pulseaudio ffmpeg systemd alsa-lib moonlight-common-c libevdev enet opus"
PKG_SECTION=""
PKG_SHORTDESC="Gamestream client for embedded systems"
PKG_LONGDESC="Moonlight Embedded is an open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield, but built for Linux"

FREESCALE_V4L_INCLUDE=""
if [ "$KODIPLAYER_DRIVER" = "bcm2835-driver" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bcm2835-driver"
elif [ "$KODIPLAYER_DRIVER" = "libamcodec" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libamcodec"
elif [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libvdpau SDL2 ffmpeg libxcb"
fi

PKG_CMAKE_OPTS_TARGET="$FREESCALE_V4L_INCLUDE"

pre_build_target() {
  cp -a $(get_build_dir moonlight-common-c)/* $PKG_BUILD/third_party/moonlight-common-c
}

makeinstall_target() {
  :
}
