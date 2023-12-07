
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:step_style/Screens/store_home.dart';
import 'package:step_style/Screens/tabs.dart';
import 'package:step_style/data/dummy_data.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  
  @override

  

  Widget build(BuildContext context) {
    
    return Scaffold(
      

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
             Color.fromARGB(255, 7, 59, 102),
             Color.fromARGB(255, 205, 126, 6)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.17,
            ),
            Stack(
              children: [
                Image.asset('assets/images/welcome-removebg-preview.png'),
                Positioned(
                  height: MediaQuery.of(context).size.height * 0.5,
                  left: MediaQuery.of(context).size.width * 0.25,
                  child:  const Row(
                    children: [
                      Text('Step',style: TextStyle(
                        fontSize:60, 
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color:Color.fromARGB(255, 0, 0, 0),
                        
                        
      
                      ),),
                      Text('Style',style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                         shadows: [Shadow(color: Colors.grey,blurRadius: 20)]
                      ),)
                    ],
                  ),
                ),
              ],
                
            ),

                 const Text('Choose your own style',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 29, 3, 75),
                    shadows: [Shadow(color: Colors.grey,blurRadius: 20)]
                ),),


                IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tabs()));}, icon: Image.asset('assets/images/welcom_icon.png'),iconSize: 250,),


          ],
        ),
      ),
    );
  }
}
