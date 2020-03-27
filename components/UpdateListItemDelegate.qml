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


Item {
    height: mainColumn.height
    width: parent.width

    property alias app_version: appVersion.text
    property alias changesModel: changesRepeater.model

    Column {
        id: mainColumn
        width: parent.width
        Label {
            id: appVersion
            anchors.margins: units.gu(2)
            fontSize: "large"
            font.bold: true
        }

        Repeater {
            id: changesRepeater

            delegate: Label {
                id: text2
                width: parent.width
                anchors {
                    left: parent.left
                    leftMargin: units.gu(1)
                    right: parent.right
                    rightMargin: units.gu(1)
                }

                wrapMode: Text.Wrap
                text: "<b>✔</b> "+modelData
            }

        }
    }

}
