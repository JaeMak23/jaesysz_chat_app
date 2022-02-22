import 'package:flutter/material.dart';
import 'package:jaesysz_chat_app/widgets/bottom_navigationbar.dart'as bnb;


class HomeScreen extends StatelessWidget {
   HomeScreen({ Key? key }) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:const Center(child: Text('HomeScreen')),
        bottomNavigationBar:bnb.BottomNavigationBar(onItemSelected: (index){
          pageIndex.value=index;
        }) ,
      );
  }
}