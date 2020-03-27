/*
 * Copyright (C) 2013-2016 Szymon Waliczek.
 *
 * Authors:
 *  Szymon Waliczek <majsterrr@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


import QtQuick 2.4
import Ubuntu.Components 1.3

UbuntuShape {
    id: shape
    radius: "medium"
    backgroundColor: "#eeeeee"
    opacity: 1

    Image {
        width: units.gu(4)
        height: units.gu(8)
        opacity: 1
        anchors.centerIn: parent
        source: Qt.resolvedUrl("../UI/flash.png")
    }
}

