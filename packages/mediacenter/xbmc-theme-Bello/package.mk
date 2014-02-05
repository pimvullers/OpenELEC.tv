################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="xbmc-theme-Bello"
PKG_VERSION="e153250219e5db569532f104d63722f4c98d94d7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xbmc.org"
PKG_URL="https://github.com/Nessus85100/Bello/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain xbmc"
PKG_PRIORITY="optional"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="xbmc-theme-Bello: XBMC Mediacenter Bello theme"
PKG_LONGDESC="XBMC Media Center (which was formerly named Xbox Media Center) is a free and open source cross-platform media player and home entertainment system software with a 10-foot user interface designed for the living-room TV. Its graphical user interface allows the user to easily manage video, photos, podcasts, and music from a computer, optical disk, local network, and the internet using a remote control."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_SOURCE_DIR="Bello-${PKG_VERSION}"

unpack() {
  tar zxf ${SOURCES}/${PKG_NAME}/${PKG_VERSION}.tar.gz -C ${BUILD}
}

make_target() {
  TexturePacker -input media/ \
                -output Textures.xbt \
                -dupecheck \
                -use_none
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/xbmc/addons/skin.bello
    cp -R */ $INSTALL/usr/share/xbmc/addons/skin.bello
    cp *.txt $INSTALL/usr/share/xbmc/addons/skin.bello
    cp *.xml $INSTALL/usr/share/xbmc/addons/skin.bello
    cp *.png $INSTALL/usr/share/xbmc/addons/skin.bello
      rm -rf $INSTALL/usr/share/xbmc/addons/skin.bello/media
      rm -rf $INSTALL/usr/share/xbmc/addons/skin.bello/_screenshots

  mkdir -p $INSTALL/usr/share/xbmc/addons/skin.bello/media
    cp Textures.xbt $INSTALL/usr/share/xbmc/addons/skin.bello/media
}
