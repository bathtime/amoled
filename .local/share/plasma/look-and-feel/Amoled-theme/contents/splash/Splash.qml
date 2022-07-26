/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2
import org.kde.plasma.core 2.0
import org.kde.plasma.components 2.0
import QtGraphicalEffects 1.0
import org.kde.kcoreaddons 1.0 as KCoreAddons // kuser

Rectangle {
    id: root
    //color: "#0173d0"
    color: "#121212"
    property int stage

    onStageChanged: {
        if (stage == 0) {
        } else if (stage == 2) {
            playAllGrid.running = true
        }
    }
    KCoreAddons.KUser {
        id: kuser
    }
    Item {
        id: content
        anchors.fill: parent
        
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        DataSource {
            id: timeSource
            engine: "time"
            connectedSources: ["Local"]
            interval: 1000
        }
        Column {
            spacing: units.smallSpacing
            anchors {
                bottom: parent.bottom
                left: parent.left
                margins: units.gridUnit * 2
            }
            Text {
                text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
                font.pointSize: 45
                renderType: Text.QtRendering
                color: "white"
                anchors.left: parent.left
                layer.enabled: true
            }
            Text {
                text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
                font.pointSize: 25
                renderType: Text.QtRendering
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                layer.enabled: true
            }
        }

        Text {
            id: text1
            y: parent.height * 0.3
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            font.pointSize: 35
            renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
            text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Hi, ") + kuser.fullName + "   ;)"
            layer.enabled: true
        }

        Row{
            anchors.top: text1.bottom
            anchors.topMargin: units.gridUnit * 3
            anchors.horizontalCenter: text1.horizontalCenter

            Image {
                id: img1
                source: "images/win.svg"
                sourceSize.height: units.gridUnit * 4
                sourceSize.width:  units.gridUnit * 4
                layer.enabled: true
            }
            Image {
                id: img2
                source: "images/kde.svg"
                sourceSize.height: units.gridUnit * 4
                sourceSize.width:  units.gridUnit * 4
                layer.enabled: true
                opacity: 0
            }
        }
    }
    ParallelAnimation{
        id: playAllGrid
        running: false
        NumberAnimation { target: img1 ; property: "x"; from: 0; to: 100; duration:     750; easing.type: Easing.InOutQuad}
        NumberAnimation { target: img1 ; property: "opacity"; from: 1; to: 0; duration: 750; easing.type: Easing.InOutQuad}
        NumberAnimation { target: img2 ; property: "opacity"; from: 0; to: 1; duration: 750; easing.type: Easing.InOutQuad}
        NumberAnimation { target: img2 ; property: "x"; from: -100; to: 0; duration:    750; easing.type: Easing.InOutQuad}
    }
}
