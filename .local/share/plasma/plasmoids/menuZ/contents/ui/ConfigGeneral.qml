/***************************************************************************
 *   Copyright (C) 2014 by Eike Hein <hein@kde.org>                        *
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

import QtQuick 2.5
import QtQuick.Controls 2.5

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons
import org.kde.draganddrop 2.0 as DragDrop
import org.kde.kirigami 2.5 as Kirigami

import org.kde.plasma.private.kicker 0.1 as Kicker
import QtQuick.Layouts 1.0 as QtLayouts

Kirigami.FormLayout {
    id: configGeneral

    anchors.left: parent.left
    anchors.right: parent.right



    property alias cfg_invertColors: invertColors.checked
    property alias cfg_useExtraRunners: useExtraRunners.checked
    property alias cfg_showBorder: showBorder.checked
    property alias cfg_widthPanel: widthPanel.value
    property alias cfg_opacityBar: opacityBar.value
    property alias cfg_textLabel: labelText.text



    Item {
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: useExtraRunners

        Kirigami.FormData.label: i18n("Search:")

        text: i18n("Expand search to bookmarks, files and emails")
    }

    Item {
        Kirigami.FormData.isSection: true
    }

    CheckBox {
        id: invertColors
        Kirigami.FormData.label: i18n("Options")
        text: i18n("Invert colors")
    }

    CheckBox {
        id: showBorder
        text: i18n("Show border")
    }

    SpinBox {
        Kirigami.FormData.label: i18n("Width on panel:")
        editable: true
        stepSize: 10
        id: widthPanel
        from: 200
        to: 600
        value: cfg_widthPanel
    }

    SpinBox {
        Kirigami.FormData.label: i18n("Transparency:")
        id: opacityBar
        editable: true
        stepSize: 10
        from: 0
        to: 100
        value: cfg_opacityBar
    }
    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Text:")

        TextField{
            id: labelText
        }
    }
}
