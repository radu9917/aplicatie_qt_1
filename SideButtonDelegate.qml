import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0


Component{
    id:buttonDelegate
    Item{

        id:root
        height:50
        width:50
        MouseArea{
            id:mouse1
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                image.width=75
                image.height=75
                root.x=x-12.5

            }
            onExited: {
                image.width=50
                image.height=50
                root.x=0

            }
            Image {
                id:image
                source: imgSrc
                fillMode: Image.PreserveAspectFit
                height:parent.height
                width:parent.width
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: mask
                }


            }
        }

        Rectangle{
            id:mask
            visible:false
            height: 50
            width: 50
            radius:width
            clip:true

        }
    }
}

