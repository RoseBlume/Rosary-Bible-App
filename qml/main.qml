import QtWebEngine 1.8
import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1

Window {
    id: window
    title: qsTr("Rosaury Gui")
    Rectangle{
        height:32
        width:parent.width * 0.5
        color:"white"
        Rectangle {
            width: parent.width * 0.2
            height: parent.height
            Button {
                width:parent.width
                height:parent.height
                text:"Bible Gateway"
                onClicked:c.viewchange(view1)
            }
        }
        Rectangle {
            width: parent.width * 0.2
            x: 0.2 * parent.width
            height: parent.height
            Button {
                width:parent.width
                height:parent.height
                text:"BibleHub"
                onClicked:c.viewchange(view2)
            }
        }
        Rectangle {
            width: parent.width * 0.2
            x: 0.4 * parent.width
            height: parent.height
            Button {
                width:parent.width
                height:parent.height
                text:"Bible.com"
                onClicked:c.viewchange(view3)
            }
        }
        Rectangle {

            width: parent.width * 0.2
            x: 0.6 * parent.width
            height: parent.height
            Button {
                width:parent.width
                height:parent.height
                text:"Bible Study"
                onClicked:c.viewchange(view4)
            }
        }
        Rectangle {
            width: parent.width * 0.2
            x: 0.8 * parent.width
            height: parent.height
            Button {
                width:parent.width
                height:parent.height
                text:"Biblica"
                onClicked:c.viewchange(view5)
            }
        }
    }
    Rectangle{
        id:"viewer"
        width:parent.width * 0.5
        height:parent.height - 32
        y: 32
        WebEngineView {
            id: view1
            anchors.fill: parent
            url: "https://www.biblegateway.com/"
            z: 1
            //top:
        }
        WebEngineView {
            id: view2
            anchors.fill: parent
            url: "https://biblehub.com/niv/"
            z: 0
            //top:
        }
        WebEngineView {
            id: view3
            anchors.fill: parent
            url: "https://www.bible.com/versions"
            z: 0
            //top:
        }
        WebEngineView {
            id: view4
            anchors.fill: parent
            url: "https://www.biblestudytools.com/"
            z: 0
            //top:
        }
        WebEngineView {
            id: view5
            anchors.fill: parent
            url: "https://www.biblica.com/online-bible/"
            z: 0
            //top:
        }
    }
    Rectangle{
        width:parent.width * 0.5
        height:parent.height
        x:parent.width * 0.5
        ScrollView {
            width:parent.width
            height:parent.height
            TextArea{
                id:area
                placeholderText:qsTr("Notes")
            }
        }
    }

    Item {
        id: c
        // This property is used to determine
        property var view: view1
        // This function is used to change the current view and send the old view to the back layer while bringing the new view to the front.
        function viewchange (a) {
            c.view.z = 0
            c.view = a
            c.view.z = 1
        }
    }
    Component.onCompleted:
    {
        width = Screen.width
        height = Screen.height
        // Turn on visibility after setting the size explictly.
        visible = true
    }
}
