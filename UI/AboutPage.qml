/*
 * Copyright (C) 2013-2016 Szymon Waliczek.
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
import "../components"

Page {
    id: aboutPage
    title: "uTorch"
    head.foregroundColor: "white"

    head.actions: [
        Action {
            iconName: "settings"
            text: i18n.tr("Settings")
            onTriggered: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
        }
    ]

    head.sections.model: [
        (aboutPage.head.sections.selectedIndex === 0 ? "<font color='#00C2FF'>"+i18n.tr("About")+"</html>":"<font color='white'>"+i18n.tr("About")+"</html>"),
        (aboutPage.head.sections.selectedIndex === 1 ? "<font color='#00C2FF'>"+i18n.tr("Credits")+"</html>":"<font color='white'>"+i18n.tr("Credits")+"</html>"),
        (aboutPage.head.sections.selectedIndex === 2 ? "<font color='#00C2FF'>"+i18n.tr("F.A.Q")+"</html>":"<font color='white'>"+i18n.tr("F.A.Q")+"</html>")
//        (aboutPage.head.sections.selectedIndex === 3 ? "<font color='#00C2FF'>"+i18n.tr("ChangeLog")+"</html>":"<font color='white'>"+i18n.tr("ChangeLog")+"</html>"),

    ]

    ListModel {
        id: contributorsModel
        ListElement { name: "Szymon Waliczek"; email: 'majsterrr@gmail.com'; role: "Author" }
        ListElement { name: "Michael Zanetti"; email: "michael_zanetti@gmx.net"; role: "Developers" }
        ListElement { name: "Niklas Wenzel"; email: "nikwen.developer@gmail.com"; role: "Developers" }
        ListElement { name: "Nekhelesh Ramananthan"; email: "nik90@ubuntu.com"; role: "Developers" }
        ListElement { name: "Sam Hewitt"; email: "snwh@ubuntu.com"; role: "Designer" }

        function dummyFunction() {
            var a = i18n.tr("Author")
            var b = i18n.tr("Developers")
            var c = i18n.tr("Designer")
        }
    }


    // F.A.Q listmodel
    ListModel {
        id: faqModel

        function loadListModel() {
            faqModel.append({ "question": i18n.tr("What devices are supported?"), "answare": i18n.tr("At the moment we support the following devices:<br> ✔BQ Aquaris e4.5<br> ✔BQ Aquaris 5<br> ✔Meizu MX4<br> ✔Nexus 4"), "extLink": ' ' })
            faqModel.append({ "question": i18n.tr("I blocked uTorch from using Camera.Service.<br>How do I fix it?"), "answare": i18n.tr("Open System Settings <b>\></b> Security and Privacy <b>\></b> App Permissions <b>\></b> Camera<br> and then make sure uTorch is <b>ticked</b> there."), "extLink":  i18n.tr("%1 Open System Settings %2").arg('<a href=\"settings:///system/security-privacy"\">').arg('</a>') })
//            faqModel.append({ "question": i18n.tr(""), "answare": i18n.tr(""), "extLink": '<a href=\"settings:///system/security-privacy"\">Text to be displayed</a>' })

        }

        // workaround to get i18n.tr() working...
        Component.onCompleted: loadListModel()
    }

    VisualItemModel {
        id: tabs

        Item {
            width: tabView.width
            height: tabView.height

            Column {
                spacing: units.gu(4)
                anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter; margins: units.gu(2) }

                UbuntuShape {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gu(20)
                    height: units.gu(20)
                    source: Image {
                        source: Qt.resolvedUrl("../uTorch.png")
                    }
                }

                Column {
                    width: parent.width
                    spacing: units.gu(0.5)

                    Label {
                        width: parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "<b>uTorch</b> " + curent_version
                        color: "white"
                        fontSize: "large"
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Label {
                        width: parent.width
                        text: i18n.tr("Torch application for Ubuntu Touch")
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                        wrapMode: Text.WordWrap
                    }

                    Button {
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: units.gu(2.5)
                        color: UbuntuColors.orange
                        text: i18n.tr("Changelog")
                        onClicked: PopupUtils.open(updatePopup)
                    }
                }

                Column {
                    width: parent.width

                    Label {
                        text: "(C) 2015 Szymon Waliczek <a href=\"mailto://majsterrr@gmail.com\">majsterrr@gmail.com</a>"
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        linkColor: "#00C2FF"
                        color: "white"
                        fontSize: "small"
                        onLinkActivated: Qt.openUrlExternally(link)
                    }

                    Label {
                        text: i18n.tr("Released under the terms of GNU GPL v3 or higher")
                        width: parent.width
                        color: "white"
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        fontSize: "small"
                    }
                }

                Label {
                    text: i18n.tr("Source code available on %1").arg("<a href=\"https://launchpad.net/utorch\">Launchpad</a>")
                    width: parent.width
                    color: "white"
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    linkColor: "#00C2FF"
                    fontSize: "small"
                    onLinkActivated: Qt.openUrlExternally(link)

                }

                Label {
                    text: i18n.tr("Homepage: %1").arg("<a href=\"https://plus.google.com/u/0/b/109835078534997175309/\">plus.google.com/uTorch</a>")
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    linkColor: "#00C2FF"
                    color: "white"
                    fontSize: "small"
                    onLinkActivated: Qt.openUrlExternally(link)

                }

            }

            Label {
                id: useCount
                anchors.right: parent.right
                anchors.rightMargin: units.gu(1)
                anchors.bottom: parent.bottom
                anchors.bottomMargin: units.gu(0.5)
                fontSize: "small"
                color: UbuntuColors.lightGrey
                text: i18n.tr("Count: %1").arg(torchOnCount.contents.torchOnCount)
            }
        }

        // Contributors TAB
        Item {
            width: tabView.width
            height: tabView.height

            ListView {
                id: contributorsList
                clip: true


                anchors.fill: parent
                model: contributorsModel
                section.property: "role"
                section.labelPositioning: ViewSection.InlineLabels

                section.delegate: ListItem {
                    height: headerText.implicitHeight + units.gu(1)
//                    divider.visible: true
                    Rectangle {
                        id: labelShader
                        anchors.fill: parent
                        opacity: 0.1
                    }

                    Label {
                        id: headerText
                        z: labelShader.z + 2
                        text: i18n.tr(section) + ":"
                        color: "#dedede"
//                        font.bold: true
                        anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter;
                                    leftMargin: units.gu(1); rightMargin: units.gu(1); topMargin: units.gu(0.5);
                                    bottomMargin: units.gu(0.5)
                        }
                    }
                }

                delegate: ListItem {
                    divider.visible: false
                    height: mainColumn1.height + units.gu(1.5)
                    Column {
                        id: mainColumn1
                        anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter;
                                    leftMargin: units.gu(2); rightMargin: units.gu(2);
                        }

                        Label {
                            text: name
                            color: "white"
                            width: parent.width
                            elide: Text.ElideRight
                        }

                        Label {
                            id: emailLabel
                            text: '<a href=\"mailto:' + email + '\">' + email + '</a>'
                            linkColor: "#00C2FF"
                            fontSize: "small"
                            width: parent.width
                            elide: Text.ElideRight
                            onLinkActivated: Qt.openUrlExternally(link)
                        }
                    }
                    onClicked: {
                        Qt.openUrlExternally("mailto:"+email)
                    }
                }
            }
        }


        // F.A.Q TAB
        Item {
            width: tabView.width
            height: tabView.height

            ListView {
                id: faqTab
                clip: true
                anchors.fill: parent
                model: faqModel
                delegate: ListItem {
                    height: faqDelegate.height + units.gu(1)
                    Column {
                        id: faqDelegate
                        anchors { left: parent.left; right: parent.right; verticalCenter: parent.verticalCenter; margins: units.gu(2) }

                        Row {
                            width: parent.width
                            height: questionLabel.height
                            spacing: units.gu(0.5)
                            Label {
                                text: "Q:"
                                color: "white"
                            }

                            Label {
                                id: questionLabel
                                text: i18n.tr(question)
                                color: "white"
                                width: parent.width - units.gu(2)
                                wrapMode: Text.Wrap
//                                elide: Text.ElideRight
                            }
                        }

                        Row {
                            width: parent.width
                            height: answerLabel.height
                            spacing: units.gu(0.5)
                            Label {
                                color: "#00C2FF"
                                text: "A:"
                            }

                            Label {
                                id: answerLabel
                                color: "#00C2FF"
                                width: parent.width - units.gu(2)
                                wrapMode: Text.Wrap
                                text: i18n.tr(answare) + " " + i18n.tr(extLink)
                                onLinkActivated: Qt.openUrlExternally(link)
                                linkColor: UbuntuColors.orange
//                                elide: Text.ElideRight
                            }
                        }



                    }
                }
            }
        }


//        // ChangeLog TAB
//        Item {
//            width: tabView.width
//            height: tabView.height
//            Label {
//                anchors.centerIn: parent
//                text: "In progres..."
//            }
//        }

    }

    ListView {
        id: tabView

        model: tabs
        interactive: false
        anchors.fill: parent
        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        currentIndex: aboutPage.head.sections.selectedIndex
        highlightMoveDuration: UbuntuAnimation.SlowDuration
    }
}
