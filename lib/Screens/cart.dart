import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Models/shoe.dart';
import 'package:step_style/providers/cart_provider.dart';

class Cart extends ConsumerWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final List<Shoe> isincart=ref.watch(cartprovider);

    Widget content=ListView(
                children: [
                  for(final shoe in isincart)
                  Padding(padding: const EdgeInsets.all(8.0),child: 
                  CartCard(shoe: shoe),)
                ],
              );

              if(isincart.isEmpty)
              {
                    content=Center(
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
                      Text('Umm... Nothing in your Cart',style: TextStyle(
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
    
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('Cart'),
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
          
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: 
                  [
                        Colors.deepPurple,
                        Colors.deepOrange,
                  ]
                  ),
          
                  
              ),
              child: content
          )
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({super.key,required this.shoe});

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    final String itemleft=shoe.items_left.toString();
    final String price=shoe.price.toString();
    return  Center(
                child: Card(
                      
                      elevation: 20,
                      child: SizedBox(
                       height: MediaQuery.of(context).size.height*0.25,
                       width: MediaQuery.of(context).size.width*0.90,
                       child: Row(
                       
                        children: [
    
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width*0.5,
                                child: Image.network(shoe.imageURL,fit: BoxFit.fill,)),
    
                            const SizedBox(width: 7,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(shoe.name,softWrap: true,style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                      const Divider(),
                                      Text(shoe.brand,style: const TextStyle(fontWeight: FontWeight.w500),),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Text('Price : $price'),
                                           const Spacer(flex: 2),
                                          Text('Item left : $itemleft',softWrap: true,)
                                        ],
                                      )
                                  ],
                                ),
                              )
                        ],
                       ),
    
                      ),
                ),
              );
  }
}