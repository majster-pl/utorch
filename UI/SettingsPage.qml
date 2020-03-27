/*
 * Copyright (C) 2013-2015 Szymon Waliczek.
 *
 * Authors:
 *  Szymon Waliczek <majsterrr@gmail.com>
 *  Niklas Wenzel <nikwen.developer@gmail.com>
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
import Ubuntu.Components.Popups 1.3
//import Ubuntu.Components.ListItems 1.3 as ListItem
//import "../components"

Page {
    id: settingsPage
    title: i18n.tr("Settings")

    head.foregroundColor: "white"

    function changeFlashSettings() {
        if(String(flashOn.contents.flashOn) === "true") {
            flashOn.contents = { flashOn: "false" }
//            firstRunDoc.contents = { firstrun: "false" }
        } else {
            flashOn.contents = { flashOn: "true" }
//            PopupUtils.open(warningMessage)
        }
        print(flashOn.contents.flashOn)

    }

//    WarningComponent {
//        id: warningMessage
//    }

    Column {
        width: parent.width
        ListItem {
            width: parent.width
            height: screenOnLabel.height + units.gu(4)
            Item {
                anchors.fill: parent
                anchors.margins: units.gu(2)
                Label {
                    id: screenOnLabel
                    anchors {
                        left: parent.left;
                        right: controlSwith.left;
                        top: parent.top;
//                        margins: units.gu(1)
                    }
                    wrapMode: Text.Wrap
                    fontSize: "medium"
                    color: "white"
                    text: i18n.tr("Start app with torch on")
                }

                Switch {
                    id: controlSwith
                    anchors {
                        right: parent.right;
                        verticalCenter: parent.verticalCenter;
                    }
                    checked: String(flashOn.contents.flashOn) === "true" ? true : false
                    onClicked: changeFlashSettings()
//                    onCheckedChanged: {
//                        changeFlashSettings()
//                    }
                }
            }

        }

    }

}
