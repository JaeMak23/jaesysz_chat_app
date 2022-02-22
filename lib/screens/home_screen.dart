import 'package:flutter/material.dart';
import 'package:jaesysz_chat_app/pages/pages.dart';
import 'package:jaesysz_chat_app/widgets/bottom_navigationbar.dart' as bnb;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: bnb.BottomNavigationBar(onItemSelected: (index) {
        pageIndex.value = index;
      }),
    );
  }
}
