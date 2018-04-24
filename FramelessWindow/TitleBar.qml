import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Window 2.2

Rectangle{
    property string icon;
    property string title:qsTr("窗口");
    property QtObject parentObj;
    property color titleColor: "#BC2F2E";
    property color minBtnClickColor: "#F1707A";//点击时颜色
    property color minBtnHoveredColor: "#E81023";//hover颜色
    property color minBtnNormalColor: "#BC2F2E";//正常状态颜色
    property color maxBtnClickColor: "#F1707A";
    property color maxBtnHoveredColor: "#E81023";
    property color maxBtnNormalColor: "#BC2F2E";
    property color closeBtnClickColor: "#F1707A";
    property color closeBtnHoveredColor: "#E81023";
    property color closeBtnNormalColor: "#BC2F2E";
//    property real dpScale: 1.5;     //在不同的分辨率屏幕下的窗口伸缩因子
//    readonly property real dp: Math.max(Screen.pixelDensity*25.4/160*dpScale);

    id:titleBar;
    color: titleColor;
    z:100
    MouseArea{
        property real xmouse;   //鼠标的x轴坐标
        property real ymouse;   //y轴坐标
        anchors.fill: parent
        //cursorShape: Qt.SizeAllCursor;

        onPressed: {
                    xmouse=mouse.x;
                    ymouse=mouse.y;
                }

        onPositionChanged: {
            parentObj.x=parentObj.x+(mouse.x-xmouse);
            parentObj.y=parentObj.y+(mouse.y-ymouse);
        }
        onDoubleClicked: {
            maxBtn.onClicked();
        }
    }

    //图标
    Image {
        id: titleIcon
        source: icon;
        width: parent.height-5*dp
        height: parent.height-5*dp
        anchors{
            left: parent.left;
            leftMargin: 5*dp;
            verticalCenter: parent.verticalCenter;
        }
    }

    //标题
    Label{
        anchors{
            left: titleIcon.right;
            leftMargin: 5*dp;
            verticalCenter: parent.verticalCenter;
        }
        text: title;
        color: "#ffffff"
        font{
            family: "Microsoft YaHei";
            pixelSize: 14;
            bold: false;
        }
    }

    //最小化
    Button{
        id:minBtn;
        anchors{
            right: maxBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: "\uf2d1";
        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(minBtn.pressed && minBtn.hovered)
                    return minBtnClickColor;
                if(minBtn.hovered)
                    return minBtnHoveredColor;
                else
                    return minBtnNormalColor;
            }
        }
        contentItem: Label{
            text: minBtn.text;
            font: minBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: minBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("最小化");

        onClicked: {
            parentObj.visibility=Window.Minimized;
        }
    }
    //最大化
    Button{
        id:maxBtn;
        anchors{
            right: closeBtn.left;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: {
            if(parentObj.visibility!==Window.FullScreen)
                return "\uf2d0";
            else
                return "\uf2d2";
        }

        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(maxBtn.pressed && maxBtn.hovered)
                    return maxBtnClickColor;
                if(maxBtn.hovered)
                    return maxBtnHoveredColor;
                else
                    return maxBtnNormalColor;
            }
        }
        contentItem: Label{
            text: maxBtn.text;
            font: maxBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: maxBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: parentObj.visibility===Window.FullScreen?qsTr("向下还原"):qsTr("最大化");

        onClicked: {
            parentObj.visibility=parentObj.visibility===Window.FullScreen?Window.Windowed:Window.FullScreen;
        }
    }
    //关闭
    Button{
        id:closeBtn;
        anchors{
            right: parent.right;
        }
        flat: true;
        font{
            family: icomoonFont.name;
            pixelSize: titleBar.height/2;
        }
        text: "\uf410";
        background: Rectangle{
            implicitWidth: titleBar.height;
            implicitHeight: titleBar.height;
            color: {
                if(closeBtn.pressed && closeBtn.hovered)
                    return closeBtnClickColor;
                if(closeBtn.hovered)
                    return closeBtnHoveredColor;
                else
                    return closeBtnNormalColor;
            }
        }

        contentItem: Label{
            text: closeBtn.text;
            font: closeBtn.font;
            color: "#ffffff";
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ToolTip.visible: closeBtn.hovered;
        ToolTip.delay: 500;
        ToolTip.text: qsTr("关闭");

        onClicked: {
            Qt.quit();
        }
    }

}
