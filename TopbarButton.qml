import QtQuick 2.0
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.12
Item {
    id:root
    property var imgSrc: "?"
    property var buttonWidth: 10
    property var buttonHeight: 10
    signal clicked()
    Rectangle{
        id:button
        color:"transparent"
        width: buttonWidth
        height: buttonHeight


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
            Image{
                id:fontAwesome
                width:parent.height*40/100
                height: parent.height*40/100
                anchors.centerIn: parent
                source: imgSrc
                fillMode: Image.PreserveAspectFit
                ColorOverlay {
                    anchors.fill: fontAwesome
                    source: fontAwesome
                    color:"gray"
                    transform:rotation
                    antialiasing: true
                                }
            }

            onPressed: {
                body.opacity = 0.25
                root.clicked()

            }
            onReleased: {
                body.opacity = 0.1
            }
            onEntered:{
                bar.color= "black"
                body.color = "black"
                body.opacity=0.1

            }

            onExited:{
                bar.color= "transparent"
                body.color = "transparent"

            }

        }


    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}
}
##^##*/
