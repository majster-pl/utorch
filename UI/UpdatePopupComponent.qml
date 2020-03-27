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
import "../components"


// First run information. ( to make sure user allow Camera.Services )
Component {
    id: warningDialog

    Dialog {
        id: dialogue
        title: "<b>" + i18n.tr("What's new?")


        Flickable {
            width: parent.width
            height: mainView.height / 2
            contentHeight: flickableColumn.height
            clip: true
            Column {
                id: flickableColumn
                width: parent.width
                spacing: units.gu(0.5)

                UpdateListItemDelegate {
                    app_version: "2.9.0"
                    changesModel: ["Fix for not working flash on Meizu Pro 5"
                    ]
                }

                UpdateListItemDelegate {
                    app_version: "2.8.0"
                    changesModel: ["New icon big thanks to Sam Hewitt (snwh)!","New translations: AST, NB, SR. Thanks to all translators!"
                    ]
                }


                UpdateListItemDelegate {
                    app_version: "2.7.5"
                    changesModel: ["Update translations ( IT ) Thanks to @Davide"]
                }

                UpdateListItemDelegate {
                    app_version: "2.7.3"
                    changesModel: ["<b>IMPORTANT</b>: With last OTA 9.0 it is NOT longer possible to use torch with screen off!<br>If you wish
to use torch all the time, your phone screen HAVE to be ON! ScreenSaver is enabled when app is open. - Sorry but there is no workaround for it
at the moment.","Add translations (EL, FI, FR, IT) thanks to translators", "Changed splash screen", '<b>NEW</b> "What\'s new?" PopUp', 'Add Changelog button
to About Page.', '<b>NEW</b> Now you can set torch to be ON when app starts.', '<b>NEW</b> Quit button added.']
                }

                UpdateListItemDelegate {
                    app_version: "2.6.0"
                    changesModel: ["Add translations ( DE, PL ) Thanks to @the_svij", "Add new popovers", "Add Donation popover",
                        "Update to newest SDK", "Add Counter", "Add F.A.Q tab", "Upgrade to hight pixel size torch symbol on lever."]
                }

                UpdateListItemDelegate {
                    app_version: "2.5.2"
                    changesModel: ["Removed Christmas animation."]
                }

                UpdateListItemDelegate {
                    app_version: "2.5.1"
                    changesModel: ["Fix uTorch typo in header.", "X-mass Icon :D ", "Fix header text color (settings and about)"]
                }

                UpdateListItemDelegate {
                    app_version: "2.5"
                    changesModel: ["Christmas Bonus :D"]
                }

                UpdateListItemDelegate {
                    app_version: "2.4"
                    changesModel: [" Update to newest Framework [1.3]", "Added settings to enable flash light to work when screen is off."]
                }

                UpdateListItemDelegate {
                    app_version: "2.3"
                    changesModel: ["Fix Camera app not working while uTorch is open.", "Screen on when app is running."]
                }

                UpdateListItemDelegate {
                    app_version: "2.1"
                    changesModel: ["New app design, enjoy material design on your Ubuntu Phone 😃"]
                }

                UpdateListItemDelegate {
                    app_version: "2.0"
                    changesModel: ["Update to new framework. ( thanks to Nekhelesh )", "Performance improvements."]
                }

                UpdateListItemDelegate {
                    app_version: "1.6"
                    changesModel: ["FIX apparmor."]
                }

                UpdateListItemDelegate {
                    app_version: "1.5"
                    changesModel: ["FIX *app version in About Page", "FIX *missing app icon in About Page."]
                }

            }
        }


        Button {
            id: button2
            width: parent.width - units.gu(3)
            text: String(afterUpdatePopoverDoc.contents.afterupdate) !== curent_version ? i18n.tr("Go to app") : "OK"
            color: UbuntuColors.green
            onClicked: {
                PopupUtils.close(dialogue)
                if(String(afterUpdatePopoverDoc.contents.afterupdate) !== curent_version) {
                    afterUpdatePopoverDoc.contents = { afterupdate: curent_version }
                    pageStack.push(Qt.resolvedUrl("MainPage.qml"));
                    console.log("[LOG]: App started without any error.")
                }
            }
        }

    }

}
