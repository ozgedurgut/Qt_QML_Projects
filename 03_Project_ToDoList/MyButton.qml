import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2

Button {
    id: root

    property color backgroundDefaultColor: "#4E5BF2"
    property color backgroundPressedColor: Qt.darker(backgroundDefaultColor, 1.2)
    property color contentItemTextColor: "white"

    text: qsTr("Button")

    contentItem: Text {
        text: root.text
        color: root.contentItemTextColor
        font.pixelSize: 15
        font.family: "Arial"
        font.weight: Font.Thin
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitHeight: 37
        implicitWidth: 83
        color: root.pressed ? root.backgroundPressedColor : root.backgroundDefaultColor
        radius: 3
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: root.pressed ? root.backgroundPressedColor : root.backgroundDefaultColor
            samples: 20
        }
    }
}
