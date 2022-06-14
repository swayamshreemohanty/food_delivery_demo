class DummyFood {
  static List<Food> dummyFoods = [
    Food(
      id: 'm1',
      title: 'Spaghetti',
      subtitle: 'Spaghetti with Tomato Sauce',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      preprationDuration: 20,
      ingredients: [
        '4 Tomatoes',
        '1 Tablespoon of Olive Oil',
        '1 Onion',
        '250g Spaghetti',
        'Spices',
        'Cheese (optional)'
      ],
      details: "This is very delicious",
      ratings: "3",
      price: 8,
      calories: 120,
    ),
    Food(
      id: 'm2',
      title: 'Toast Hawaii',
      subtitle: 'Toast Hawaii',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      preprationDuration: 10,
      ingredients: [
        '1 Slice White Bread',
        '1 Slice Ham',
        '1 Slice Pineapple',
        '1-2 Slices of Cheese',
        'Butter'
      ],
      details: "This is very delicious",
      ratings: "2.8",
      price: 4,
      calories: 98,
    ),
    Food(
      id: 'm3',
      title: 'Hamburger',
      subtitle: 'A Classic Hamburger',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      preprationDuration: 45,
      ingredients: [
        '300g Cattle Hack',
        '1 Tomato',
        '1 Cucumber',
        '1 Onion',
        'Ketchup',
        '2 Burger Buns'
      ],
      details: "This is very delicious",
      ratings: "2.4",
      price: 2,
      calories: 10,
    ),
    Food(
      id: 'm4',
      title: 'Wiener Schnitzel',
      subtitle: 'Wiener Schnitzel',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      preprationDuration: 60,
      ingredients: [
        '8 Veal Cutlets',
        '4 Eggs',
        '200g Bread Crumbs',
        '100g Flour',
        '300ml Butter',
        '100g Vegetable Oil',
        'Salt',
        'Lemon Slices'
      ],
      details: "This is very delicious",
      ratings: "3.8",
      price: 15,
      calories: 238,
    ),
    Food(
      id: 'm5',
      title: 'Salad',
      subtitle: 'Salad with Smoked Salmon',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      preprationDuration: 15,
      ingredients: [
        'Arugula',
        'Lamb\'s Lettuce',
        'Parsley',
        'Fennel',
        '200g Smoked Salmon',
        'Mustard',
        'Balsamic Vinegar',
        'Olive Oil',
        'Salt and Pepper'
      ],
      details: "This is very delicious",
      ratings: "2.1",
      price: 10,
      calories: 61,
    ),
  ];
}

class Food {
  final String id;
  final String title;
  final String subtitle;
  final String ratings;
  final String imageUrl;
  final List<String> ingredients;
  final String details;
  final int preprationDuration;
  final double price;
  final int calories;
  Food({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.ratings,
    required this.imageUrl,
    required this.ingredients,
    required this.details,
    required this.preprationDuration,
    required this.price,
    required this.calories,
  });
}

class FoodCategoryList {
  static List<String> foodCategoryList = [
    'Fast food',
    'Fruit item',
    'Vegetables'
  ];
}
