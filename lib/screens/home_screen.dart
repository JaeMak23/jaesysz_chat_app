import 'package:flutter/material.dart';
import 'package:jaesysz_chat_app/helper.dart';
import 'package:jaesysz_chat_app/pages/pages.dart';
import 'package:jaesysz_chat_app/theme.dart';
import 'package:jaesysz_chat_app/widgets/glowing_action_button.dart';
import 'package:jaesysz_chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart' as ios;
import 'package:jaesysz_chat_app/widgets/navigationbar_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitles = const [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
        leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: Icons.search,
              onTap: () {
                print('TODO search');
              },
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemsSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: GlowingActionButton(
                    color: AppColors.secondary,
                    icon: ios.CupertinoIcons.add,
                    onPressed: () {
                      print('TODO on new messgae');
                    }),
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
        ),
      ),
    );
  }
}
