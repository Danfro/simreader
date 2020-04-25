import QtQuick 2.0
import Ubuntu.Components 1.3

ListItem {
    //height: units.gu(5)
    property alias title: layout.title
    property alias subtitle : layout.subtitle

    height: layout.height + (divider.visible ? divider.height : 0)
    ListItemLayout {
        id: layout
    }
}
