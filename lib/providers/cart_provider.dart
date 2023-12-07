import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Models/shoe.dart';
class CartNotifier extends StateNotifier<List<Shoe>>
{
      CartNotifier(): super([]);

      bool togglecart(Shoe shoe)
      {
              final isshoeinCart=state.contains(shoe);

              if(isshoeinCart)
              {
                  state=state.where((s) => s.id!=shoe.id).toList();
                  return false;
              }
              else
              {
                   state=[...state,shoe];
                   return true;
              }
      }
}

final cartprovider=StateNotifierProvider<CartNotifier,List<Shoe>>((ref) =>CartNotifier() );