import QtQuick 2.5


Rectangle {
    id: root
    color: "black"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit / 2)
        }

        Image {
            id: logo

            y: (parent.height / 12)
            anchors.horizontalCenter: parent.horizontalCenter

            source: "images/tux.svg"
            sourceSize.height: parent.height - (parent.height / 6)
        }

        Image {
            id: busyIndicator

            anchors.horizontalCenter: parent.horizontalCenter
            source: "images/gear-black.svg"
            sourceSize.height: parent.height / 3.75
            y: parent.height - (parent.height / 2.1)

            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 8000
                loops: Animation.Infinite
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
