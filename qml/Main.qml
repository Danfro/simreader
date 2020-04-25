/*
 * Copyright (C) 2020  Lionel Duboeuf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * ubuntu-calculator-app is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import MeeGo.QOfono 0.2

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'simreader.lduboeuf'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    property var modems :[]


    Page {
        anchors.fill: parent

        header: PageHeader {
            id: pageHeader
            title: i18n.tr('SimReader')
        }


        Flickable {
            contentHeight: simRepeater.contentHeight
            anchors {
                top: pageHeader.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            clip: true



            ListView {
                id: simRepeater
                anchors {
                    left: parent.left
                    right: parent.right
                }
               model: root.modems
               // model: ["/ril_0","toto"]
                delegate: Sim {
                    //height: implicitHeight
                    onHeightChanged: console.log("height:", height)
                    simNb: index
                    path: modelData

                }
            }

        }
    }

    OfonoManager {
        id: ofonoManager
        onModemsChanged: {
            root.modems = modems.slice(0).sort()
            console.log("ofonoManager",modems.slice(0).sort() )
            //root.createQML(modems.slice(0).sort())
        }
    }

}
