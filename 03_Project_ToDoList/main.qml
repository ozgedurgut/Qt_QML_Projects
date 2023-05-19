import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.3
import "."
ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "To-Do List"
    Rectangle {
        color: "#F2F2F2"
        anchors.fill: parent

        Column {
            anchors.fill: parent
            spacing: 10
            leftPadding: 10
            rightPadding: 10
            topPadding: 10
            bottomPadding: 10

            RowLayout {
                spacing: 10
                Text {
                    text: "To-Do List"
                    font.pixelSize: 15
                    font.family: "Arial"
                    font.weight: Font.Thin
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            RowLayout {
                TextField {
                    id: taskInput
                    placeholderText: "Enter a task"
                    Layout.preferredWidth: parent.width - timeInput.width - spacing
                    height: 40
                }

                TextField {
                    id: timeInput
                    placeholderText: "Time"
                    Layout.minimumWidth: 100
                    Layout.maximumWidth: 100
                    height: 40
                }
            }

            MyButton {
                id: root
                text: "Add Task"
                onClicked: {
                    if (taskInput.text !== "") {
                        taskListModel.append({ task: taskInput.text, done: false, time: timeInput.text })
                        taskInput.text = ""
                        timeInput.text = ""
                    }
                }
            }

            ScrollView {
                width: parent.width
                height: parent.height - taskInput.height - root.height

                ListView {
                    width: parent.width
                    contentHeight: contentItem.childrenRect.height

                    model: ListModel {
                        id: taskListModel
                    }

                    delegate: Item {
                        width: parent.width
                        height: 40

                        Rectangle {
                            color: done ? "lightgreen" : "white"
                            width: parent.width
                            height: parent.height

                            Row {
                                anchors.fill: parent
                                spacing: 5

                                MouseArea {
                                    width: 20
                                    height: parent.height
                                    onClicked: {
                                        done = !done
                                        taskListModel.setProperty(index, "done", done)
                                    }

                                    Rectangle {
                                        width: parent.width
                                        height: parent.height
                                        radius: 2
                                        border.color: "gray"
                                        border.width: 1
                                        visible: true
                                        antialiasing: true

                                        Rectangle {
                                            width: 10
                                            height: 10
                                            anchors.centerIn: parent
                                            color: done ? "lightgreen" : "red"
                                        }
                                    }
                                }

                                Text {
                                    text: index + 1 + ". " + model.task + " (Time: " + model.time + ")"
                                    anchors.verticalCenter: parent.verticalCenter
                                    leftPadding: 5
                                    font.pixelSize: 16
                                    color: done ? "gray" : "black"
                                    elide: Text.ElideRight
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
