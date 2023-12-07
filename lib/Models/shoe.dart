class Shoe
{
      const Shoe({
        required this.id,
        required this.name,
       required this.brand,

        required this.gender,
        required this.category,
       required this.price,
       required this.is_in_inventory,
       required this.items_left,
       required this.imageURL,
       required this.slug,

      });

      final int id;
      final String name;
      final String brand;

      final int  gender;

      final String category;
      final int price;

      final bool is_in_inventory;
      final int items_left;
      final String imageURL;
      final String slug;

}