import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.3
import QtMultimedia 5.5
import QtQuick.Dialogs 1.2
import QtQuick.XmlListModel 2.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    maximumHeight: 500
    minimumHeight: 400
    maximumWidth: 700
    minimumWidth: maintoolbar.implicitWidth
    height: 500
    color: "#ffffff"
    opacity: 1
    property alias maintoolbar: maintoolbar
    property alias columnLayout: columnLayout
    property alias rowLayout1: rowLayout1
    property alias progressBar: progressBar
    property alias textField: textField
    title: qsTr("Nhóm 4")

    ToolBar {
        id: maintoolbar
        RowLayout {
            width: parent.width

            ToolButton {

                text: "open"
                iconSource: "icons8-movies-folder-30.png"
                onClicked: {
                    fileDialog1.open()
                }
            }
            ToolButton {

                text: "add list"
                iconSource: "icons8-add-list-30.png"
                onClicked: {

                }
            }
            ToolButton {
                iconSource: "icons8-in-progress-24.png"
            }
            Slider {
                id: slidervideoprogeress
                Layout.fillWidth: true
                value: videoplay.metaData.peakValue
                maximumValue: 1
            }

            ToolButton {

                iconSource: "icons8-google-web-search-30.png"
                text: "Search"
            }
            TextField {
                anchors.right: parent
                id: textField
                placeholderText: "Nhập key"
                font.family: "Tahoma"
                font.capitalization: Font.MixedCase
                text: videoplay.metaData.peakValue
            }
        }
    }

    FileDialog {
        id: fileDialog1
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog1.fileUrls)
            Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
    }

    ColumnLayout {
        height: applicationWindow.height - maintoolbar.height
        spacing: 1
        y: maintoolbar.height
        anchors.top: maintoolbar.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.topMargin: 0
        id: columnLayout
        RowLayout {
            id: rowLayout
            width: 640
            height: 300
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            SplitView {
                id: splitView
                visible: true
                clip: false
                Layout.fillHeight: true
                Layout.fillWidth: true
                anchors.fill: parent
                TableView {
                    id: tableView
                    x: -46
                    y: 118
                    height: parent.height
                    width: 100
                    model: libraryModel
                    TableViewColumn {
                        title: "Listvideo"
                        role: "author"
                    }
                }
                ListModel {
                    id: libraryModel
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/a.MKV"
                        author: "beautifull girl"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/b.MKV"
                        author: "HTML5 1"
                    }

                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/d.MKV"
                        author: "HTML5 2"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/e.MKV"
                        author: "HTML5 3"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/f.MKV"
                        author: "HTML5 4"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/g.MKV"
                        author: "HTML5 5"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/h.MKV"
                        author: "HTML5 6"
                    }
                    ListElement {
                        title: "C:/Users/LUCHEN97/Desktop/QT forder/Projects/ListviewQML/example/c.MKV"
                        author: "HTML5 7"
                    }
                }

                Video {
                    autoPlay: true
                    autoLoad: true
                    id: videoplay

                    volume: 0.3
                    source: libraryModel.get(tableView.currentRow).title
                    focus: true
                }
            }
        }

        ProgressBar {
            id: progressBar
            x: 0
            width: parent.width
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 38
            value: videoplay.duration
            maximumValue: videoplay.duration + 100
            anchors.top: columnLayout.bottom
            anchors.topMargin: -61
        }
        RowLayout {
            width: parent.fillWidth
            spacing: 1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true

            RowLayout {
                ToolButton {

                    iconSource: "back.png"
                    text: "back"
                    onClicked: {
                        videoplay.seek(videoplay.position - 5000)
                    }
                }
                ToolButton {
                    iconSource: "play.png"
                    text: "play"
                    onClicked: {
                        videoplay.play()
                        labelstatus.text = "Play: " + videoplay.duration
                    }
                }
                ToolButton {

                    iconSource: "pause.png"
                    text: "pause"
                    onClicked: {
                        videoplay.pause()
                        labelstatus.text = "Pause"
                    }
                }

                ToolButton {

                    iconSource: "forward.png"
                    text: "forward"
                    onClicked: {
                        videoplay.seek(videoplay.position + 5000)
                    }
                }
                ToolButton {
                    iconSource: "icons8-stop-30.png"
                    text: "stop"
                    onClicked: {
                        videoplay.stop()
                        labelstatus.text = "Stop"
                    }
                }

                ToolButton {
                    iconSource: "icons8-repeat-30.png"
                    text: "Loop"
                    onClicked: {
                        videoplay.loops = true
                        labelstatus.text = "Repeat"
                    }
                }
            }
            Rectangle {
                width: 250
                Layout.fillWidth: true
            }
            RowLayout {
                id: rowLayout1
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                ToolButton {

                    id: mutebtn
                    iconSource: "icons8-voice-30.png"
                    text: "mute"
                }

                Slider {
                    id: slidervolumeprogess
                    width: parent - 70
                    Layout.fillWidth: false
                    value: videoplay.volume.valueOf()
                    maximumValue: 1
                    onValueChanged: {
                        videoplay.volume = slidervolumeprogess.value
                        if (slidervolumeprogess.value == 0) {
                            labelstatus.text = "Muted"
                        } else {
                            labelstatus.text = "Volume: " + slidervolumeprogess.value * 100 + " %"
                        }
                    }
                }
            }
        }
    }

    statusBar: StatusBar {
        id: statusmain
        activeFocusOnTab: true
        Label {
            id: labelstatus
            text: videoplay.position.valueOf()
        }
    }
}
