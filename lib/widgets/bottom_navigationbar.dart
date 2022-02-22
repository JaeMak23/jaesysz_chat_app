import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:jaesysz_chat_app/widgets/navigationbar_item.dart';

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemsSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarItem(
            index: 0,
            label: 'Messages',
            icon: ios.CupertinoIcons.bubble_left_bubble_right_fill,
            isSelected: (selectedIndex == 0),
            onTap: handleItemsSelected,
          ),
          NavigationBarItem(
            index: 1,
            label: 'Notifications',
            icon: ios.CupertinoIcons.bell_solid,
            isSelected: (selectedIndex == 1),
            onTap: handleItemsSelected,
          ),
          NavigationBarItem(
            index: 2,
            label: 'Calls',
            icon: ios.CupertinoIcons.phone_fill,
            isSelected: (selectedIndex == 2),
            onTap: handleItemsSelected,
          ),
          NavigationBarItem(
            index: 3,
            label: 'Contacts',
            icon: ios.CupertinoIcons.person_2_fill,
            isSelected: (selectedIndex == 3),
            onTap: handleItemsSelected,
          ),
        ],
      ),
    );
  }
}
