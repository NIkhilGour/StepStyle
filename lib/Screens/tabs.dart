import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Screens/cart.dart';
import 'package:step_style/Screens/store_home.dart';
import 'package:step_style/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';
import 'package:step_style/providers/cart_provider.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int activepageindex=0;

  void _selectscreen(int index)
  {
      setState(() {
        activepageindex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
   
        Widget activepage=const StoreHome();

        if(activepageindex==1)
        {
            activepage= const Cart();
        }
       return Scaffold(
            extendBody: true,
          // backgroundColor: Colors.transparent,
            
            body: activepage,
            bottomNavigationBar: BottomNavigationBar(
              onTap: _selectscreen,
              currentIndex: activepageindex,
              backgroundColor:  const Color.fromARGB(0, 193, 80, 27),
            selectedItemColor: Colors.deepPurple,
              elevation: 0,

              items: const [

                  BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: 'Home',),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,size: 30,),label: 'Cart')
            ]),

       );
  }
}