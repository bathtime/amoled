/***************************************************************************
 *   Copyright (C) 2013-2015 by Eike Hein <hein@kde.org>                   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 2.4
import QtGraphicalEffects 1.0

import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.extras 2.0 as PlasmaExtras


FocusScope {
    id: root

    focus: true




    property bool done: false

    property int iconSize: units.iconSizes.medium
    property int tileSide: units.iconSizes.large + theme.mSize(theme.defaultFont).height
                           + (4 * units.smallSpacing)
                           + (2 * Math.max(highlightItemSvg.margins.top + highlightItemSvg.margins.bottom,
                                           highlightItemSvg.margins.left + highlightItemSvg.margins.right))


    property bool searching: (searchField.text != "")
    property int nColumns: 6

    Layout.minimumWidth:  tileSide * nColumns + units.largeSpacing
    Layout.maximumWidth:  tileSide * nColumns + units.largeSpacing
    Layout.minimumHeight: tileSide * 5 + units.largeSpacing * 3
    Layout.maximumHeight: tileSide * 5 + units.largeSpacing * 3

    signal appendSearchText(string text)

    ScaleAnimator{id: playAllGrid; target: allAppsGrid ; from: 0.9; to: 1; duration: 500; easing.type: Easing.InOutQuad }


    function colorWithAlpha(color, alpha) {
        return Qt.rgba(color.r, color.g, color.b, alpha)
    }

    function reset() {
        mainColumn.visibleGrid = allAppsGrid
        searchField.clear();
        searchField.focus = true
        mainColumn.visibleGrid.tryActivate(0,0);

    }

    function toggle(){
        plasmoid.expanded = !plasmoid.expanded;
    }



    Connections {
        target: plasmoid
        onExpandedChanged: {
            if (expanded) {
                playAllGrid.start()
                mainColumn.visibleGrid.tryActivate(0,0);
            }
        }
    }

    PlasmaExtras.Heading {
        id: dummyHeading
        visible: false
        width: 0
        level: 1
    }

    TextMetrics {
        id: headingMetrics
        font: dummyHeading.font
    }

    PlasmaComponents.Menu {
        id: contextMenu
        PlasmaComponents.MenuItem {
            action: plasmoid.action("configure")
        }
    }


    PlasmaComponents.TextField {
        id: searchField
        anchors.top: parent.top
        focus: true
        width:  parent.width
        visible: false
        onTextChanged: {
            runnerModel.query = text;
            appendSearchText(text)
        }
        function clear() {
            text = "";
        }
        function backspace() {
            if(searching){
                text = text.slice(0, -1);
            }
            focus = true;
        }
        function appendText(newText) {
            if (!root.visible) {
                return;
            }
            focus = true;
            text = text + newText;
        }
        Keys.onPressed: {
            if (event.key == Qt.Key_Space) {
                event.accepted = true;
            } else if (event.key == Qt.Key_Down) {
                event.accepted = true;
                mainColumn.visibleGrid.tryActivate(0,0);
            } else if (event.key == Qt.Key_Tab || event.key == Qt.Key_Up) {
                event.accepted = true;
                mainColumn.visibleGrid.tryActivate(0,0);
            } else if (event.key == Qt.Key_Backspace) {
                event.accepted = true;
                if(searching)
                    searchField.backspace();
                else
                    searchField.focus = true
            } else if (event.key == Qt.Key_Escape) {
                event.accepted = true;
                if(searching){
                    clear()
                } else {
                    root.toggle()
                }
            }
        }
    }




    ColumnLayout{
        height: parent.width - tileSide
        width: parent.width
        anchors.margins: units.smallSpacing
        spacing: searching ? units.smallSpacing : units.largeSpacing/2

        RowLayout{
            Layout.fillWidth: true
            height: units.gridUnit

            PlasmaExtras.Heading {

                id: mainLabelGrid
                Layout.leftMargin: units.smallSpacing
                Layout.alignment:  Qt.AlignHCenter | Qt.AlignVCenter
                color:  colorWithAlpha(theme.textColor, 0.8)
                level: 4
                text: searching ? i18n('Results') : i18n("Favorites")

            }

            Item{
                Layout.fillWidth: true
            }

            PlasmaComponents3.ToolButton {
                Layout.alignment:  Qt.AlignHCenter | Qt.AlignVCenter
                icon.name:   'go-previous'
                onClicked: {
                    searchField.text = ''
                    searchField.focus = true
                }
                flat: false
                opacity: searching ? 1 : 0
                text: 'Back'
                ToolTip.delay: 1000
                ToolTip.timeout: 1000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Favorites")
            }
        }

        Item {
            id: mainColumn

            Layout.maximumHeight: searching ?  root.height - units.iconSizes.large * 2 :  tileSide * 2
            Layout.minimumHeight: searching ?  root.height - units.iconSizes.large * 2 :  tileSide * 2
            Layout.minimumWidth: parent.width

            property Item visibleGrid: allAppsGrid
            function tryActivate(row, col) {
                if (visibleGrid) {
                    visibleGrid.tryActivate(row, col);
                }
            }

            ItemGridView {
                id: allAppsGrid
                width:  tileSide * nColumns
                height: tileSide * 2
                cellWidth:   tileSide
                cellHeight:  tileSide
                iconSize:  root.iconSize
                square: true
                model: globalFavorites
                dropEnabled: true
                usesPlasmaTheme: false
                verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
                enabled: (opacity == 1.0) ? 1 : 0
                opacity: searching ? 0 : 1
                onOpacityChanged: {
                    if (opacity == 1.0) {
                        mainColumn.visibleGrid = allAppsGrid;
                    }
                }
                onKeyNavDown: documentsFavoritesGrid.tryActivate(0,0)

            }

            ItemMultiGridView {
                id: runnerGrid
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.minimumWidth: mainColumn.width
                enabled: (opacity == 1.0) ? 1 : 0
                model: runnerModel

                verticalScrollBarPolicy: Qt.ScrollBarAlwaysOn
                horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

                grabFocus: true
                isSquare: true
                opacity: searching ? 1.0 : 0.0
                onOpacityChanged: {
                    if (opacity == 1.0) {
                        mainColumn.visibleGrid = runnerGrid;
                    }
                }
                onKeyNavDown: {

                    if(!searching)
                        documentsFavoritesGrid.tryActivate(0,0)

                }

            }

            Keys.onPressed: {

                if (event.key == Qt.Key_Tab) {
                    event.accepted = true;
                    documentsFavoritesGrid.tryActivate(0,0)
                } else if (event.key == Qt.Key_Backspace) {
                    event.accepted = true;
                    if(searching)
                        searchField.backspace();
                    else
                        searchField.focus = true
                } else if (event.key == Qt.Key_Escape) {
                    event.accepted = true;
                    if(searching){
                        searchField.clear()
                    } else {
                        root.toggle()
                    }
                } else if (event.text != "") {
                    event.accepted = true;
                    searchField.appendText(event.text);
                }
            }
        }



        PlasmaExtras.Heading {
            id: headLabelDocuments
            color: colorWithAlpha(theme.textColor, 0.8)
            level: 4
            text: i18n("Recommended")
            Layout.leftMargin: units.smallSpacing
            visible: !searching
        }

        RowLayout{
            id: recentItem
            Layout.fillWidth: true
            Layout.minimumHeight: tileSide * 2
            Layout.maximumHeight: tileSide * 2
            visible: !searching
            spacing: 0

            ItemGridView {
                id: documentsFavoritesGrid
                width:  tileSide * 4
                height: cellHeight * 8
                cellWidth:   tileSide * 2
                cellHeight:  24
                iconSize:    units.iconSizes.smallMedium
                model: rootModel.modelForRow(0);
                dropEnabled: true
                usesPlasmaTheme: false

                onKeyNavUp: {
                    mainColumn.visibleGrid.tryActivate(0,0);
                }

                Keys.onPressed: {
                    if (event.key == Qt.Key_Tab) {
                        event.accepted = true;
                        mainColumn.visibleGrid.tryActivate(0,0)
                    }  else if (event.key == Qt.Key_Backspace) {
                        event.accepted = true;
                        if(searching)
                            searchField.backspace();
                        else
                            searchField.focus = true
                    } else if (event.key == Qt.Key_Escape) {
                        event.accepted = true;
                        if(searching){
                            searchField.clear()
                        } else {
                            root.toggle()
                        }
                    } else if (event.text != "") {
                        event.accepted = true;
                        searchField.appendText(event.text);
                    }

                }
            }

            Item{
                Layout.fillWidth: true
            }

            Clock{
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                visible: !searching
            }
            Item{
                Layout.fillWidth: true
            }
        }

        Item{
            Layout.fillHeight: true
        }

    }
    Rectangle{

        width: parent.width
        height: units.iconSizes.large
        color: colorWithAlpha(theme.textColor,0.05)
        anchors.bottom: parent.bottom
        radius: 6
        Footer{
            anchors.fill: parent
        }

    }


    Keys.onPressed: event => {
                        if (event.key === Qt.Key_Escape) {
                            plasmoid.expanded = false;
                        }
                    }

    Component.onCompleted: {
        kicker.reset.connect(reset);
        windowSystem.hidden.connect(reset);
    }
}
