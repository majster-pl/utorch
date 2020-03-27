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
        title: "<b><font color='Black'>" + i18n.tr("Hi Dude!") + "</font></b>"
//        title: "Hi Dude!"


        Column {
            width: parent.width
            spacing: units.gu(0.5)
            Label {
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
//                color: "#4e4e4e"
                color: UbuntuColors.blue
                text: i18n.tr("I hope you enjoy my app and it works for you, so why not")
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                color: UbuntuColors.blue
                iconSource: Qt.resolvedUrl("star.svg")
//                iconName: "non-starred"
                text: i18n.tr("Rate this app!")
                iconPosition: "right"
                onClicked: Qt.openUrlExternally("scope://com.canonical.scopes.clickstore?q=szymonutorch")
            }

        }

        Column {
            width: parent.width
            spacing: units.gu(0.5)

            Label {
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                color: UbuntuColors.purple
                text: i18n.tr("I'm always looking for new ways to improve this app, so if you have interesting ideas and want to share them with me just click below.")
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                color: UbuntuColors.purple
                iconSource: Qt.resolvedUrl("gmail.png")
                iconPosition: "right"
                text: i18n.tr("Contact me!")
                onClicked: Qt.openUrlExternally("mailto:majsterrr@gmail.com?subject=uTorch Enquiry.")
            }
        }


        Column {
            width: parent.width
            spacing: units.gu(0.5)
            Label {
                width: parent.width
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                text: i18n.tr("If you think this app deserved your dontation just click on button bellow.")
                color: UbuntuColors.green
//                color: "black"
            }

            Button {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                color: UbuntuColors.green
                iconPosition: "right"
                iconSource: Qt.resolvedUrl("paypal.png")
                text: i18n.tr("Donate!")
                onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BRK2ZVY44HNUU")
            }
        }



        // devider
        Item {
            width: parent.width
            height: units.gu(2)
        }




        Button {
            text: checkBox.checked ? i18n.tr("<b>Sorry to hear</b>") : i18n.tr("Ask me later")
            color: UbuntuColors.red
            onClicked: {
                if(checkBox.checked) {
                    donationPopoverDoc.contents = { donationpopover: "false" }
                } else {
                    donationPopoverDoc.contents = { donationpopover: "true" }
                }

                PopupUtils.close(dialogue)
            }
        }


        Row {
            width: parent.width
            height: units.gu(2)
            CheckBox {
                id: checkBox
                anchors.verticalCenter: parent.verticalCenter
                checked: String(donationPopoverDoc.contents.donationpopover) === "true" ? false : true
//                width: units.gu(2)
            }
            Label {
                anchors.verticalCenter: parent.verticalCenter
                fontSize: "small"
                text: i18n.tr("Don't show this message again.")
            }
        }

    }

}
