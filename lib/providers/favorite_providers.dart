import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_style/Models/shoe.dart';

class FavoriteNotifier extends StateNotifier<List<Shoe>>
{
        FavoriteNotifier(): super([]);

        bool toggleFavorite(Shoe shoe)
        {
              final isShoeFavorite=state.contains(shoe);

              if(isShoeFavorite)
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

final favoriteShoeProvider=StateNotifierProvider<FavoriteNotifier,List<Shoe>>((ref) => FavoriteNotifier());