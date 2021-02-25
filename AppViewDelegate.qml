import QtQuick 2.0
import QtQuick.Controls 2.5
Component{
    id:buttonDelegate
Item {
    id:root
    width:gridView.cellWidth
    height:gridView.cellHeight
    signal clicked()
    Rectangle{
        id:button
        width:parent.width
        height:parent.height
        color:"transparent"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled:true
            Rectangle{
                id:body
                anchors.fill:parent
                color:"white"
                opacity:0.1
                border.width:10
                border.color:"#2f4b7d"


            }
            Label {
                id: appname
                text: appstr
                color: "white"
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: image

                width: parent.width*30/100
                height: parent.height*30/100
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: appname.bottom
                source: imgSrc
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
            onPressed: {
                body.opacity = 0.5
                root.clicked()

            }
            onReleased: {
                body.opacity = 0.25
            }
            onEntered:{

                body.opacity=0.25
                appname.opacity=1
            }

            onExited:{
                appname.color= "white"
                body.opacity=0.1
            }


        }

    }
}
}
