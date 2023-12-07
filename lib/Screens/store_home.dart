import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:step_style/Screens/shoe_screen.dart';
import 'package:step_style/data/dummy_data.dart';
import 'package:step_style/providers/favorite_providers.dart';
import 'package:step_style/widgets/categories.dart';
import 'package:step_style/Models/category.dart';
import 'package:step_style/providers/dummyshoe_provider.dart';

class StoreHome extends ConsumerWidget {
  const StoreHome({super.key});
 // final List<Shoe>availableshoes;

  void _selectCategory(BuildContext context,Gender gender,WidgetRef ref)
  {
          final availableshoes=ref.watch(shoesprovider);
          final filteredshoe=availableshoes.where((shoe) => shoe.gender==(gender.id)).toList();
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ShoeScreen(shoe: filteredshoe, title: gender.title)));
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoriteshoe=ref.watch(favoriteShoeProvider);
    return   Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoeScreen(shoe: favoriteshoe, title: 'Your Favorites')));
          }, icon: const Icon(Icons.favorite,size: 30,color: Colors.red,))
        ],
         backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
         elevation: 5,
         title: const Text('StepStyle',style: TextStyle(fontSize: 30),),
      ),
    
        body: Container(
          height:MediaQuery.of(context).size.height*0.90,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurple,
                Colors.deepOrange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              ),
              
          ),
          child: ListView(
            children: [
              for(final category in availableCategories)
              
              Center(child: Categories(category: category, onSelectCategory: (){_selectCategory(context, category,ref);}))
            ],
          )
        ));
  }
}
