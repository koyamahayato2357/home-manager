import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

PanelWindow {
    readonly property list<HyprlandWorkspace> workspaces: Hyprland.workspaces.values

    id: root
    color: "transparent"
    HyprlandWindow.opacity: 0.7
    implicitHeight: 30

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 5
        left: 5
        right: 5
    }

    Rectangle {
        anchors.fill: parent
        radius: 6
        color: "black"
    }

    RowLayout {
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        // nix icon
        Text {
            Layout.alignment: Qt.AlignVCenter
            leftPadding: 10
            text: "󱄅"
            font.pixelSize: 20
            color: "red"
        }

        // hyprland workspaces
        ListView {
            id: hyprlandWorkspaces
            width: 500
            model: workspaces
            orientation: Qt.Horizontal
            add: Transition {
                NumberAnimation {
                    properties: "y"
                    from: 0
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }
            delegate: Row {
                rightPadding: 1
                Text { text: name }
                anchors.verticalCenter: parent.verticalCenter

                ToolButton {
                    id: button
                    text: name
                    onClicked: workspaces[index].activate()

                    // prevent colors from changing hover or click
                    hoverEnabled: false
                    onPressedChanged: if (pressed) down = false

                    contentItem: Rectangle {
                        anchors.fill: parent
                        radius: 3
                        color: root.color
                        border.width: 1
                        border.color: "darkred"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: button.text
                            color: "white"
                        }
                    }
                }
            }
        }
    }

    Text {
        id: clock
        anchors.centerIn: parent
        color: "red"

        Process {
            id: dateProc
            command: [ "date", "+%Y/%m/%d %H:%M" ]
            running: true
            stdout: StdioCollector {
                onStreamFinished: clock.text = this.text
            }
        }

        Timer {
            interval: 1000 * 60 // 1 min
            running: true
            repeat: true
            onTriggered: dateProc.running = true
        }
    }
}
