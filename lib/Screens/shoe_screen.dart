import 'package:flutter/material.dart';
import 'package:step_style/Models/shoe.dart';
import 'package:step_style/Screens/cart.dart';
import 'package:step_style/Screens/shoe_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/providers/cart_provider.dart';

class ShoeScreen extends ConsumerWidget {
  const ShoeScreen({super.key, required this.shoe, required this.title});

  final List<Shoe> shoe;
  final String title;
 
  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final List<Shoe>shoeincart=ref.watch(cartprovider);
    Widget content= ListView(
              children: [
                for (final item in shoe)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowShoe(shoe: item),
                  )
              ],
            );

        if(shoe.isEmpty)
        {
          content= Center(
               child: Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: MediaQuery.of(context).size.height*0.30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(55, 0, 0, 0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child:  const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text('Umm... Nothing in your Favorites',style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                      Divider(),
                      Text('Add some Item ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                  ],
                ),
               ),
             );
        }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (content)=>const Cart()));}, icon: const Icon(Icons.shopping_bag))
          ],
        ),
         body:  
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
             child: content

           
            ),);
  }
}

class ShowShoe extends StatelessWidget {
  const ShowShoe({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    final String itemleft = shoe.items_left.toString();
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) =>  ShoeDetails(shoe: shoe,))));
        },
        child: Card(
            color: const Color.fromARGB(0, 255, 255, 255),
            //elevation: 20,
            borderOnForeground: true,
            // shape: const CircleBorder(side: BorderSide.none,eccentricity: 0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                
                Hero(
                  tag: shoe.id,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(shoe.imageURL),
                          fit: BoxFit.fill,
                          colorFilter: const ColorFilter.mode(
                              Color.fromARGB(255, 255, 255, 255), BlendMode.dst)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Text(
                        shoe.brand,
                        style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Text(
                            shoe.price.toString(),
                            style: const TextStyle(
                                color: Colors.lime,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Item left $itemleft',style: const TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
