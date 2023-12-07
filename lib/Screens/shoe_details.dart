import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Models/shoe.dart';
import 'package:step_style/Screens/cart.dart';
import 'package:step_style/providers/cart_provider.dart';
import 'package:step_style/providers/favorite_providers.dart';

class ShoeDetails extends ConsumerWidget {
  const ShoeDetails({super.key, required this.shoe});
  final Shoe shoe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String shoeprice = shoe.price.toString();
    final String itemleft = shoe.items_left.toString();
    final favoriteshoe = ref.watch(favoriteShoeProvider);
    final cartShoe = ref.watch(cartprovider);
    bool isInCart = cartShoe.contains(shoe);
    bool isFav = favoriteshoe.contains(shoe);
    String cartbutton = 'Add to Cart';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Choose your Style'),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteShoeProvider.notifier)
                    .toggleFavorite(shoe);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(wasAdded
                          ? 'Item added as favorite'
                          : 'Item Removed')),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(scale: Tween<double>(begin: 0.3,end: 1).animate(animation),child: child,),
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  key: ValueKey(isFav),
                ),
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurple,
          Colors.deepOrange,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: shoe.id,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),

                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.45,

                    
                    child: Image.network(
                      shoe.imageURL,
                      fit: BoxFit.fill,
                    ),
              ),
            ),
            const Divider(),
            Text(
              shoe.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 10)]),
            ),
            const Divider(),
            Text(
              shoe.brand,
              style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Price : $shoeprice',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Item left : $itemleft',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              'Category : ${shoe.category}',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.deepPurple),
        child: TextButton(
            onPressed: () {
              final isInCart = ref.read(cartprovider.notifier).togglecart(shoe);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(isInCart ? 'Item Added to Cart ' : 'Item removed')));
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: Tween<double>(begin: 0.5,end: 1).animate(animation),child: child,);
              },
              child: Text(
                isInCart ? 'Already in cart' : 'Add to Cart',
                key: ValueKey(isInCart),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
