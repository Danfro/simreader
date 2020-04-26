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
            contentHeight: simColumn.childrenRect.height
            anchors {
                topMargin: pageHeader.height
                fill: parent
            }
            clip: true
            flickableDirection: Flickable.AutoFlickIfNeeded

            Column {
            id: simColumn

                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                ListItem {
                    width: parent.width
                    height: simOne.height
                    divider { visible: false; }

                    Sim {
                        id: simOne
                        simNb: 0
                        path: root.modems[0] !== undefined ? root.modems[0] : ""

                    }
                }

                ListItem {
                    width: parent.width
                    height: simTwo.height
                    divider { visible: false; }
                    visible: root.modems[1] !== undefined ? true : false

                    Sim {
                        id: simTwo
                        simNb: 1
                        path: root.modems[1] !== undefined ? root.modems[1] : ""

                    }
                }
            }
        }
    }

    OfonoManager {
        id: ofonoManager
        onModemsChanged: {
            root.modems = modems.slice(0).sort()
            console.log("ofonoManager",modems.slice(0).sort() )
            console.log("path1: " + root.modems[0] )
            console.log("path2: " + root.modems[1] )
        }
    }
}
