import QtQuick 2.0
import QtQuick.Controls 2.4
Item {
    id:root
    property var nameButton: "?"
    signal clicked()
    Rectangle{
        id:button
        color:"transparent"
        anchors.fill:parent

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled:true

            Rectangle{
                id:body
                anchors.fill:parent
                color:"transparent"
            }

            Rectangle {
                id: bar
                height: parent.height*5/100
                width:parent.width
                color: "transparent"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
            }
            Label {
                id: label
                color: "white"
                text: nameButton
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 8


            }
            onPressed: {
                body.opacity = 0.5
                root.clicked()

            }
            onReleased: {
                body.opacity = 0.25
            }
            onEntered:{
                bar.color= "white"
                body.color = "white"
                body.opacity=0.25
                label.opacity=1
            }

            onExited:{
                bar.color= "transparent"
                body.color = "transparent"
                label.color= "white"
                label.opacity=1
            }

        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}
}
##^##*/
