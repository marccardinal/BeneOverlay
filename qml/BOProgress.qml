/* Copyright (C) 2017 Benjamin Isbarn.

   This file is part of BeneOverlay.

   BeneOverlay is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   BeneOverlay is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with BeneOverlay.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2



BOGroupBox {
    id: root

    property var data_ref_custom_style
    property var data_ref_icon_enabled
    property var data_ref_icon_size
    property var data_ref_primary_color
    property var data_ref_secondary_color
    property var data_ref_primary_font
    property var data_ref_secondary_font

    BOSwitch {
        id: dep_enabled_switch

        anchors.top: parent.top
        anchors.left: parent.left

        name: "Show DEP"
        description: "Enable DEP readout."
        data_ref: data_ref_manager.getDataRef("progress/dep_enabled")
    }
    BOSwitch {
        id: arr_enabled_switch

        anchors.top: dep_enabled_switch.bottom
        anchors.left: parent.left

        name: "Show ARR"
        description: "Enable ARR readout."
        data_ref: data_ref_manager.getDataRef("progress/arr_enabled")
    }
    BOSwitch {
        id: dtg_enabled_switch

        anchors.top: arr_enabled_switch.bottom
        anchors.left: parent.left

        name: "Show DTG"
        description: "Enable DTG readout."
        data_ref: data_ref_manager.getDataRef("progress/dtg_enabled")
    }
    BOSwitch {
        id: eta_enabled_switch

        anchors.top: dtg_enabled_switch.bottom
        anchors.left: parent.left

        name: "Show ETA"
        description: "Enable ETA readout."
        data_ref: data_ref_manager.getDataRef("progress/eta_enabled")
    }
    BOSwitch {
        id: ete_enabled_switch

        anchors.top: eta_enabled_switch.bottom
        anchors.left: parent.left

        name: "Show ETE"
        description: "Enable ETE readout."
        data_ref: data_ref_manager.getDataRef("progress/ete_enabled")
    }

    BOSwitch {
        id: custom_style_switch

        anchors.top: ete_enabled_switch.bottom
        anchors.left: parent.left

        name: "Custom Style"
        description: "Enable custom styling for this widget"
        data_ref: root.data_ref_custom_style
    }

    BOSwitch {
        id: icon_enabled_switch

        anchors.top: custom_style_switch.bottom
        anchors.left: parent.left

        name: "Icon Enabled"
        description: "Enable the icon for this widget"
        data_ref: root.data_ref_icon_enabled

        visible: custom_style_switch.checked && custom_style_switch.visible
    }

    BOSpinBox {
        id: icon_size_spin_box

        anchors.top: icon_enabled_switch.bottom
        anchors.left: parent.left

        name: "Icon Size"
        data_ref: root.data_ref_icon_size
        from: 0

        visible: icon_enabled_switch.checked && icon_enabled_switch.visible
    }

    BOColorSelector {

        id: primary_color_color_selector

        anchors.top: icon_size_spin_box.visible? icon_size_spin_box.bottom : icon_enabled_switch.bottom
        anchors.left: parent.left

        name: "Primary Color"
        data_ref: data_ref_primary_color

        visible: custom_style_switch.checked && custom_style_switch.visible

    }

    BOColorSelector {

        id: secondary_color_color_selector

        anchors.left: primary_color_color_selector.right
        anchors.verticalCenter: primary_color_color_selector.verticalCenter

        name: "Secondary Color"
        data_ref: data_ref_secondary_color

        visible: custom_style_switch.checked && custom_style_switch.visible

    }

    BOFontSelector {

        id: primary_font_font_selector

        anchors.top: secondary_color_color_selector.bottom
        anchors.left: parent.left

        name: "Primary Font"

        data_ref: root.data_ref_primary_font

        visible: custom_style_switch.checked && custom_style_switch.visible
    }

    BOFontSelector {
        id: secondary_font_font_selector

        anchors.left: primary_font_font_selector.right
        anchors.top: secondary_color_color_selector.bottom

        name: "Secondary Font"

        data_ref: root.data_ref_secondary_font

        visible: custom_style_switch.checked && custom_style_switch.visible
    }


}

