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
import QtSystemInfo 5.0
import U1db 1.0 as U1db
import "components"
import "UI"

MainView {
    id: mainView

    property bool torchIsOn
    property string curent_version

    onCurent_versionChanged: {
        // check if app is running for first time, if so then run Welcome screen.
        if(String(firstRunDoc.contents.firstrun) === "true") {
            console.log("[LOG]: Running app for the first time. Opening Welcom Screen")
            PopupUtils.open(firstRunPopup)
        }
        else if(String(afterUpdatePopoverDoc.contents.afterupdate) !== curent_version) {
            print("VERSION IS DIFFERENT! SHOW MESSAGE!")
            console.log("[LOG]: New app version detected, running Update message.")
            PopupUtils.open(updatePopup)
        }
        else {
            // puch MainPage.qml
//            pageStack.push(Qt.resolvedUrl("UI/MainPage.qml"));
            timer1.start()
            console.log("[LOG]: App started without any error.")
        }
    }

    onTorchIsOnChanged: torchOnCount.addOne()

    // Timer added only to remove wird white bar at the top of the splash screen when app starts.
    Timer {
        id: timer1
        interval: 100
        running: false
        onTriggered: pageStack.push(Qt.resolvedUrl("UI/MainPage.qml"));
    }


    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.majster-pl.utorch"
    automaticOrientation: false

    backgroundColor: UbuntuColors.coolGrey

    width: units.gu(50)
    height: units.gu(75)

    Connections {
        target: Qt.application
        onAboutToQuit: {
            print("NARA!!")
            torchIsOn = 0
        }
    }

//    Connections {
//        target: Qt.application
//        onActiveChanged: {
//            if(String(flashOn.contents.flashOn) === "false") {
//                if(Qt.application.active) {
////                    camera.start()
//                    torchIsOn = false
//                }
////                else {
////                    camera.stop()
////                }
//            }

//        }
//    }


    //// DATA STORAGE ////

    // Definig U1 database
    U1db.Database {
        id: storage
        path: "uTorch.u1db"
    }

    // Document to store the firstrun value of the app
    U1db.Document {
        id: flashOn
        database: storage
        docId: "flashOn"
        create: true
        defaults: { "flashOn": "false" }
    }

    // Document to store the number of times torch has benn turned on.
    // usefull to display messages, reminders, adverts etc...
    U1db.Document {
        id: torchOnCount
        database: storage
        docId: "torchOnCount"
        create: true
        defaults: { "torchOnCount": 0 }

        function addOne() {
            torchOnCount.contents = { torchOnCount: (torchOnCount.contents.torchOnCount + 1) }
        }
    }


    // Document to store the firstrun value of the app
    U1db.Document {
        id: firstRunDoc
        database: storage
        docId: "firstRun"
        create: true
        defaults: { "firstrun": "true" }
    }



    // Document to store if user want to see Donation popup.
    U1db.Document {
        id: donationPopoverDoc
        database: storage
        docId: "donationPopover"
        create: true
        defaults: { "donationpopover": "true" }
    }

    // Document to store the firstrun value of the app
    U1db.Document {
        id: afterUpdatePopoverDoc
        database: storage
        docId: "afterUpdate"
        create: true
        defaults: { "afterupdate": "1" }
    }



    // model to read manifestFile
    JSONListModel {
        id: manifestJSONmodel
        source: Qt.resolvedUrl(".click/info/%1.manifest".arg(applicationName))
        query: "$"
        onCountChanged: {
            curent_version = model.get(0).version
        }

    }


    // Mian PageStack
    PageStack {
        id: pageStack
    }

    // ScreenSaver (to keep screen on then app has focus)
    ScreenSaver {
        id: screenSaver
        screenSaverEnabled: !Qt.application.active
    }

    // First run Popover
    FirstRunPopupComponent {
        id: firstRunPopup
    }

    // Update Popover to be displayed every time new version is pushed to the store.
    UpdatePopupComponent {
        id: updatePopup
    }


}



