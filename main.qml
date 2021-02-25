import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

Window {
    id: window
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Hello World")



    Rectangle {
        id: background
        width: window.width-sidebar.width
        height: window.height-topbar.height-rectangle.height
        color: "#2f4b7d"
        border.color: "#fdfdfd"
        border.width: 0
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.top: rectangle.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{position:0.45726; color:"#2f4b7d"}
            GradientStop{position:0.75; color:"#1c2d59"}
            GradientStop {
                position: 0.2094
                color: "#1c2d59"
            }

            GradientStop{position:1 ; color:"#2f4b7d"}


        }
        Rectangle {
            id: appbarmask
            width: appbar.width+20
            height: 50
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.rightMargin: 40
            anchors.leftMargin: 40
            opacity: 0.2
        }
        Rectangle {
            id: collection
            y: 40
            width: 252
            height: 36
            color: "#ffffff"
            border.color: "#2f4b7d"
            border.width: 0
            anchors.verticalCenter: appbarmask.verticalCenter
            anchors.left: appbarmask.left
            anchors.leftMargin: 10

            opacity:0.25

            Image {
                id: arrowcollection
                x: 210
                y: 8
                width: 20
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                source: "qrc:/icons/images/chevron-down-solid.svg"
                anchors.rightMargin: 10
                fillMode: Image.PreserveAspectFit
                MouseArea{
                    id:mousearrow
                    property var bpressed: 0
                    anchors.fill:parent
                    hoverEnabled: true
                    onExited: {
                        if(bpressed===1){
                            closemenu.target=arrowcollection
                            closemenu.start()
                            collectionMenu.visible=false
                            bpressed=0
                        }
                    }
                    onPressed: {
                        if(bpressed===0){
                            openmenu.target=arrowcollection
                            openmenu.start()
                            collectionMenu.visible=true
                            bpressed=1
                        }else{
                            closemenu.target=arrowcollection
                            closemenu.start()
                            collectionMenu.visible=false
                            bpressed=0
                        }

                    }
                }
            }
        }

        Rectangle {
            id: collectionbar
            y: 40
            width: 250
            height: 50
            color: "transparent"
            anchors.left: parent.left
            anchors.leftMargin: 40

            Label {
                id: label
                x: 30
                y: 11
                color: "#f3f3f5"
                text: qsTr("Collection")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                font.bold: false
                font.pointSize: 13
            }

        }


        GridView {
            id: gridView
            width: appbarmask.width+20
            height: parent.height*70/100
            cellWidth: (width)/4
            cellHeight:(height - 10)/2
            anchors.left: parent.left
            anchors.top: appbarmask.bottom
            clip: true

            delegate: AppViewDelegate{ }
            model:AppViewModel{}
            anchors.leftMargin: 30
            anchors.topMargin: 20


        }

        Rectangle {
            id: collectionMenu
            width: collection.width
            height: 108
            opacity: 1
            visible:false
            color: "#2f4b7d"
            anchors.left: collection.left
            anchors.top: collection.bottom

            Rectangle {
                id: collectionMenuMask
                opacity: 0.5
                color: "#ffffff"
                anchors.fill: parent

                Column {
                    id: column
                    anchors.fill: parent

                    Label {
                        id: label1
                        width: parent.width
                        height: parent.height/3
                        color: "#fbfbfb"
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }

                    Label {
                        id: label2
                        width: parent.width
                        height: parent.height/3
                        color: "#f4f5f5"
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }

                    Label {
                        id: label3
                        width: parent.width
                        height: parent.height/3
                        color: "#f6f7f7"
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                    }
                }
            }
        }

        Row {
            id: appbuttons
            x: 549
            y: 40
            width: 300
            height: 50
            anchors.right: appbarmask.right
            anchors.rightMargin: 20



            AppbarButton {
                id: appbarButton
                height: parent.height
                width:parent.width/4
                nameButton: "NEW"
            }

            AppbarButton {
                id: appbarButton1
                height: parent.height
                width:parent.width/4
                nameButton: "ALL"
            }

            AppbarButton {
                id: appbarButton2
                height: parent.height
                width:parent.width/4
                nameButton: "FEATURED"
            }

            AppbarButton {
                id: appbarButton3
                height: parent.height
                width:parent.width/4
                nameButton: "POPULAR"
            }
        }





    }






    Rectangle {
        id: sidebar
        width: 100
        height: parent.height
        color: "#001435"

        ListView {
            id: buttonList
            width: 50
            height: parent.height
            x:parent.width/2 - width/2
            topMargin: 20

            delegate:SideButtonDelegate{}
            model:SideButtonModel{}
            spacing: 40

        }
    }


    Rectangle {
        id: rectangle
        x: 0
        width: topbar.width
        height: parent.height*30/100
        color: "#f3f3f5"
        anchors.left: sidebar.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0

        PageIndicator {
            id: pageIndicator

            width: 61
            height: 25
            anchors.top: parent.bottom
            currentIndex: swipeView.currentIndex
            interactive: true
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            count: swipeView.count

            delegate: Rectangle {
                implicitWidth: 8
                implicitHeight: 8

                radius: width / 2
                color: "white"

                opacity: index === pageIndicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 100
                    }
                }
            }
        }

        SwipeView {
            id: swipeView
            anchors.fill: parent
            Item{
                id:page1
                Text{
                    text:"You are on page " + (pageIndicator.currentIndex+1)
                    anchors.centerIn: parent
                }
            }
            Item{
                id:page2
                Text{
                    text:"You are on page " + (pageIndicator.currentIndex+1)
                    anchors.centerIn: parent
                }
            }
            Item{
                id:page3
                Text{
                    text:"You are on page " + (pageIndicator.currentIndex+1)
                    anchors.centerIn: parent
                }
            }
            Item{
                id:page4
                Text{
                    text:"You are on page " + (pageIndicator.currentIndex+1)
                    anchors.centerIn: parent
                }
            }
        }
    }

    Rectangle {
        id: topbar
        y: 0
        height: parent.height*6/100
        color: "#ffffff"
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        TopbarButton{
            id:search
            imgSrc: "qrc:/icons/images/search-solid.svg"
            buttonWidth:parent.height
            buttonHeight: parent.height
            height:buttonHeight
            width:buttonWidth
            antialiasing: true
        }

        TextField {
            id: textField
            y: 12
            width:200
            height: parent.height*80/100
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: search.right
            anchors.leftMargin: -5

            placeholderText: qsTr("Text Field")
            background: Rectangle{
                implicitWidth: parent.width
                implicitHeight: parent.height
                color:"transparent"



            }

        }

        Row {
            id: topbarContent
            height: parent.height
            width: 344
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            spacing: 0
            anchors.rightMargin: 30
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            TopbarButton{
                id:mail
                imgSrc: "qrc:/icons/images/envelope-solid.svg"
                buttonWidth:parent.height
                buttonHeight: parent.height
                height:buttonHeight
                width:buttonWidth
                antialiasing: true

            }
            TopbarButton{
                id:bell
                imgSrc: "qrc:/icons/images/bell-solid.svg"
                buttonWidth:parent.height
                buttonHeight: parent.height
                height:buttonHeight
                width:buttonWidth
                antialiasing: true

            }


            Row {
                id: row1
                width: 200
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                rightPadding: 20
                spacing: 8
                leftPadding: 30

                Image {
                    id: image3
                    width: 60
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: "qrc:/icons/images/profile_pic.jpg"
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: name
                    text: qsTr("Hatz Gion")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 15
                }

                Image {
                    id: arrowprofile
                    width: 10
                    height: 10
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/icons/images/chevron-down-solid.svg"
                    fillMode: Image.PreserveAspectFit
                    MouseArea{
                        id:mouse1
                        anchors.fill:parent
                        property var bpressed:0
                        width: 15
                        height: 15
                        hoverEnabled: true
                        onExited: {
                            if(bpressed===1){
                                closemenu.target=arrowprofile
                                closemenu.start()
                                profileMenu.visible=false
                                bpressed=0
                            }
                        }


                        onPressed: {
                            if(bpressed===0){
                                openmenu.target=arrowprofile
                                openmenu.start()
                                profileMenu.visible=true
                                bpressed=1
                            }else{
                                closemenu.target=arrowprofile
                                closemenu.start()
                                profileMenu.visible=false
                                bpressed=0
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: profileMenu
                width: row1.width-30
                height: 100
                color: "#ffffff"
                anchors.right: parent.right
                anchors.top: row1.bottom
                anchors.rightMargin: 25
                anchors.topMargin: 0
                visible: false

                Column {
                    id: column1
                    anchors.fill: parent

                    Label {
                        id: label4
                        width: parent.width
                        height: parent.height/4
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    Label {
                        id: label5
                        width: parent.width
                        height: parent.height/4
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    Label {
                        id: label6
                        width: parent.width
                        height: parent.height/4
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }

                    Label {
                        id: label7
                        width: parent.width
                        height: parent.height/4
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                }

            }

        }
    }



    RotationAnimation{
        id:openmenu

        from:0
        to:180
        duration:250
        direction: RotationAnimation.Clockwise
    }
    RotationAnimation{

        id:closemenu
        from:180
        to:0
        duration:250
        direction: RotationAnimation.CounterClockwise
    }





}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:8}D{i:11}D{i:22}D{i:56}D{i:43}
}
##^##*/
