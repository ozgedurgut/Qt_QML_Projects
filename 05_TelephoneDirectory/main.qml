import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Phonebook"

    ListModel {
        id: phonebookModel
        ListElement { name: "Ozge Durgut"; phoneNumber: "0512121212" }
        ListElement { name: "Ibrahim Celikkol"; phoneNumber: "0987643210" }
        ListElement { name: "Mansur Yavas"; phoneNumber: "4567890123" }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: searchInput
            placeholderText: "Search"
            Layout.fillWidth: true
            height: 40

            onTextChanged: {
                var searchQuery = searchInput.text.toLowerCase();
                var filteredContacts = Qt.createQmlObject('import QtQuick 2.6; ListModel{}', contactsListView);

                for (var i = 0; i < phonebookModel.count; i++) {
                    var contact = phonebookModel.get(i);
                    if (contact.name.toLowerCase().indexOf(searchQuery) !== -1 ||
                            contact.phoneNumber.toLowerCase().indexOf(searchQuery) !== -1) {
                        filteredContacts.append(contact);
                    }
                }
                contactsListView.model = filteredContacts;
            }
        }

        TextField {
            id: nameInput
            placeholderText: "Name"
            Layout.fillWidth: true
            height: 40
        }

        TextField {
            id: phoneNumberInput
            placeholderText: "Phone Number"
            Layout.fillWidth: true
            height: 40
        }

        Button {
            text: "Add Contact"
            onClicked: {
                var name = nameInput.text;
                var phoneNumber = phoneNumberInput.text;

                if (name !== "" && phoneNumber !== "") {
                    phonebookModel.append({ name: name, phoneNumber: phoneNumber });
                    nameInput.text = "";
                    phoneNumberInput.text = "";
                }
            }
        }

        ListView {
            id: contactsListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: phonebookModel

            delegate: Item {
                width: contactsListView.width
                height: 60

                Rectangle {
                    color: index % 2 === 0 ? "#f2f2f2" : "#ffffff"
                    anchors.fill: parent

                    Text {
                        text: model.name
                        font.pixelSize: 18
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: 10
                    }

                    Text {
                        text: model.phoneNumber
                        font.pixelSize: 18
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        rightPadding: 10
                    }
                }
            }
        }
    }
}
