import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("array of objects")

    property var blockList: [
        ({x: 10,  y:  20, xmove: 1, ymove: 2, color: "Red"}),
        ({x: 100, y:  20, xmove: 1, ymove: 0, color: "Green"}),
        ({x: 10,  y: 200, xmove: 1, ymove: -1, color: "Red"}),
        ({x: 30,  y:  50, xmove: 1, ymove: 1, color: "Black"})
    ]

    Repeater {
        id: blockListRepeater
        model: blockList

        Rectangle {
            id: rect
            x: modelData.x
            y: modelData.y

            width: 10
            height: 10

            color: modelData.color
        }
    }

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: {
            for(var i=0; i<blockListRepeater.count; i++) {
                blockListRepeater.itemAt(i).x += blockList[i].xmove;
                blockListRepeater.itemAt(i).y += blockList[i].ymove;
            }
        }
    }
}
