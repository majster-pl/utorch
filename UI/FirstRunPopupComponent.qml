/*
 * Copyright (C) 2013-2016 Szymon Waliczek.
 *
 * Authors:
 *  Szymon Waliczek <majsterrr@gmail.com>
 *
 * This file is part of SocketWorld app for Ubuntu Touch
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


// First run information. ( to make sure user allow Camera.Services )
Component {
    id: warningDialog

    Dialog {
        id: dialogue
        title: "<b><font color='red'>" + i18n.tr("Important!") + "</font></b>"

        Label {
            width: parent.width
            wrapMode: Text.Wrap
            font.bold: true
            color: "#4e4e4e"
            horizontalAlignment: Text.AlignHCenter
            text: i18n.tr("Please make sure that you <b>allow</b> uTorch to use Camera.Services!")
        }

        Label {
            width: parent.width
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            // TRANSLATORS: please make sure you inser html code in right places, thanks!
            text: i18n.tr("If by mistake you refuse uTorch to use Camera then to change it you have to go to:<br><br>System Settings <b>\></b> Security and Privacy <b>\></b> App Permissions <b>\></b> Camera<br>and then make sure uTorch is <b>ticked</b> there.")
        }

        // devider
        Item {
            width: parent.width
            height: units.gu(3)
        }

        Button {
            id: button2
            width: parent.width - units.gu(3)
            // TRANSLATORS: Better to leave this OK
            text: i18n.tr("OK")
            color: UbuntuColors.green
            onClicked: {
                PopupUtils.close(dialogue)
                firstRunDoc.contents = { firstrun: "false" }
                pageStack.push(Qt.resolvedUrl("MainPage.qml"));
                console.log("[LOG]: App started without any error.")
            }
        }

    }

}
