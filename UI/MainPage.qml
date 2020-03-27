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
import QtMultimedia 5.0
import "../components"

Page {
    id: root
    property alias torchOn: torchSwitch.torchOn

    title: "uTorch"
    head.foregroundColor: "white"

    head.actions: [
        Action {
            iconName: "edit-clear"
            text: i18n.tr("Close")
            onTriggered: {
                torchIsOn = 0
                Qt.quit()
            }
        },
        Action {
            iconName: "navigation-menu"
            text: i18n.tr("More")
            onTriggered: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
        },
        Action {
            iconSource: Qt.resolvedUrl("donate.svg")
            text: i18n.tr("More")
            onTriggered: PopupUtils.open(donatePopover)
        }
    ]

    Camera {
        id: camera
        flash.mode: torchOn ? Camera.FlashVideoLight : Camera.FlashOff
    }

    Component.onCompleted: {
        if(String(flashOn.contents.flashOn) === "true") {
            torchIsOn = 1
        }
    }

//            onClicked: Qt.openUrlExternally("settings:///system/security-privacy")


    DonatePopoverComponent {
        id: donatePopover
    }


    TorchSwitch {
        id: torchSwitch
        anchors.centerIn: parent
        // count how many times torch was on...
        onTorchOnChanged: {
            torchIsOn = torchOn
            if(String(donationPopoverDoc.contents.donationpopover) === "true") {
                // after every 10 times torch on run this:
                if(torchOnCount.contents.torchOnCount !== 1) {
                    if(torchOnCount.contents.torchOnCount % 10 === 1) {
                        if(torchIsOn) {
                            PopupUtils.open(donatePopover)
                        } else {
                            torchOnCount.addOne()
                        }

                    }
                }

            }


        }


    }

    // workaround for Turbo (
    VideoOutput {
        source: camera
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 100
        width: height
        focus : visible // to receive focus and capture key events when visible
    }


    Item {
        id: animationHelper
        width: 1
        height: 1
        anchors {
            left: parent.left;
            top: parent.top;
            topMargin: -units.gu(6) // move helper to the top of the app (including header)
        }
    }

    // blue animated background
    Rectangle {
        anchors.centerIn: animationHelper
        width: torchSwitch.torchOn ? 3*parent.height : 0
        height: torchSwitch.torchOn ? 3*parent.height : 0
        radius: width/2
        color: "#00C2FF"
        z: torchSwitch.z - 1

        Behavior on width {
            UbuntuNumberAnimation {
                duration: torchIsOn ? UbuntuAnimation.SleepyDuration : UbuntuAnimation.FastDuration
            }
        }

        Behavior on height {
            UbuntuNumberAnimation {
                duration: torchIsOn ? UbuntuAnimation.SleepyDuration : UbuntuAnimation.FastDuration
            }
        }
    }


}
