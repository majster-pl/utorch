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
    id: mainTorch
    width: units.gu(10)
    height: units.gu(25)
    backgroundColor: "#292929"
    radius: "medium"

    property bool torchOn: buttonView.currentIndex

    onTorchOnChanged: Haptics.play()


    Item {
        id: torch_arrows
        anchors { top: buttonView.top; horizontalCenter: buttonView.horizontalCenter; topMargin: units.gu(6.5) }
        width: units.gu(5)

        Column {
            anchors.centerIn: parent
            spacing: units.gu(0.6)
            Image {
                width: units.gu(5)
                height: units.gu(2)
                opacity: 0.3
                source: Qt.resolvedUrl("grap/up-arrows.png")
            }
            Image {
                width: units.gu(5)
                height: units.gu(2)
                opacity: 0.6
                source: Qt.resolvedUrl("grap/up-arrows.png")
            }
            Image {
                width: units.gu(5)
                height: units.gu(2)
                source: Qt.resolvedUrl("grap/up-arrows.png")
            }

        }
    }


    ListModel {
        id: buttonModel
        ListElement { component: "" }
        ListElement { component: "TorchLever.qml" }
    }

    ListView {
        id: buttonView
        anchors.fill: parent
        model: buttonModel
        clip: true
        boundsBehavior: ListView.StopAtBounds
        snapMode: ListView.SnapToItem
        highlightFollowsCurrentItem: true
        preferredHighlightBegin: 0
        preferredHighlightEnd: height * .5
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 250
        flickDeceleration: units.gu(625)
        currentIndex: torchIsOn

        delegate: Loader {
            width: ListView.view.width
            height: ListView.view.height / 2

            source: model.component
        }
    }
}
