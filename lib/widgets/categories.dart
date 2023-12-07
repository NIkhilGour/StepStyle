import 'package:flutter/material.dart';
import 'package:step_style/Models/category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key,required this.category,required this.onSelectCategory});

final Gender category;

 final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onSelectCategory,
      child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
                color: const Color.fromARGB(29, 255, 255, 255),
                elevation: 10,
                shadowColor: Colors.white,
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.75,

                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          category.image,
                           fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width ,
                         height: MediaQuery.of(context).size.height,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration:  const BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              color: Color.fromARGB(120, 0, 0, 0)),
                             
                              
                          child:   Align(
                            alignment: Alignment.center,
                            child: Text(
                                
                              category.title,
                              style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                      
                 ),
                  // 
                ),
        ),
      
    );
  }
}