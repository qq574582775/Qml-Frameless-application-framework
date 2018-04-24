import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Rectangle{
    id:button
    width: 70
    height: btn_label.height*1.1
    signal clicked()
    property alias text:btn_label.text
    color : active?"red":"blue"
    radius: 50
    border.width: 2
    border.color: "#ffffff"

    Text {
        id: btn_label
        font.pointSize: 14
        width: parent.width
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: button
        text: "xxx"
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            button.clicked();
        }
    }
}
