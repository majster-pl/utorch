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


Component {
    id: warningDialog

    Dialog {
        id: dialogue
        title: "<b><font color='red'>" + i18n.tr("Warning!") + "</font></b>"
        // Created on Label
        Label {
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: "#4e4e4e"
            text: i18n.tr("Using this option might couse Camera and other aplications <b>NOT</b> to work as expected or at all!<br><br><b>You are using this on your own risk!</b>")
            horizontalAlignment: Text.AlignHCenter
        }

        // devider
        Item {
            width: parent.width
            height: units.gu(3)
        }


        // Ok button
        Row {
            width: parent.width
            spacing: units.gu(2)
            // cancel button
            Button {
                id: button
                width: parent.width / 2 - units.gu(1)
                text: i18n.tr("<b>OK</b>")
                color: UbuntuColors.red
                onClicked: PopupUtils.close(dialogue)
            }
            Button {
                id: button2
                width: parent.width / 2 - units.gu(1)
                text: i18n.tr("<b>No thanks!</b>")
                color: UbuntuColors.green
                onClicked: {
                    PopupUtils.close(dialogue)
                    controlSwith.checked = false
                    changeFlashSettings()
                }
            }

        }

    }

}
