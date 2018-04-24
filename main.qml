import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import qt.Player 1.0
import "FramelessWindow"

ApplicationWindow {
    property real dpScale: 1.5;     //在不同的分辨率屏幕下的窗口伸缩因子
    readonly property real dp: Math.max(Screen.pixelDensity*25.4/160*dpScale);

    property real minWidth: 500*dp;
    property real minHeight: 400*dp;
    id:mainwindow
    visible: true
    width: 800*dp
    height: 600*dp
    flags:Qt.FramelessWindowHint | Qt.Window;

    Player{
        id:music_player
    }

    FontLoader{
        id:icomoonFont;
        source: "qrc:/Font/Font Awesome 5 Free-Solid-900.otf";
    }
    FontLoader{
        id:regularIcomoonFont;
        source: "qrc:/Font/Font Awesome 5 Free-Regular-400.otf";
    }

    FramelessWindow{
        parentObj: mainwindow;
        titleIcon: "qrc:/images/logo.png"
        titleText: qsTr("无边框窗口DEMO")
    }
}
