// Category repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'models/category.dart';

class CategoryRepository {
  //Get list of categories by type (men/women/kids)
  //TODO: fetch from local DB
  List<Category> getCategories(int typeId) {
    switch (typeId) {
      case 1:
      case 2:
      case 3:
        return [
          Category(
              id: 1,
              title: 'New ' + typeId.toString(),
              image: 'assets/thumbs/category/new.png',
              typeId: 1),
          Category(
              id: 2,
              title: 'Clothes ' + typeId.toString(),
              image: 'assets/thumbs/category/clothes.png',
              typeId: 1),
          Category(
              id: 3,
              title: 'Shoes ' + typeId.toString(),
              image: 'assets/thumbs/category/shoes.png',
              typeId: 1),
          Category(
              id: 4,
              title: 'Accessories ' + typeId.toString(),
              image: 'assets/thumbs/category/accessories.png',
              typeId: 1),
        ];
        break;
      case 4:
        return [
          Category(id: 10, title: 'Tops', image: '', typeId: 4),
          Category(id: 11, title: 'Shirts & Blouses', image: '', typeId: 4),
          Category(id: 12, title: 'Cardigans & Sweaters', image: '', typeId: 4),
          Category(id: 13, title: 'Knitwear', image: '', typeId: 4),
          Category(id: 14, title: 'Blazers', image: '', typeId: 4),
          Category(id: 15, title: 'Knitwear', image: '', typeId: 4),
          Category(id: 16, title: 'Blazers', image: '', typeId: 4),
          Category(id: 17, title: 'Outerwear', image: '', typeId: 4),
          Category(id: 18, title: 'Pants', image: '', typeId: 4),
          Category(id: 19, title: 'Jeans', image: '', typeId: 4),
          Category(id: 20, title: 'Shorts', image: '', typeId: 4),
          Category(id: 21, title: 'Skirts', image: '', typeId: 4),
          Category(id: 22, title: 'Dresses', image: '', typeId: 4),
        ];
        break;
    }
    return [];
  }

  //Get category details
  //TODO: fetch details from local DB
  Category getCategoryDetails(int categoryId) {
    return Category(
        id: 1,
        title: 'Category ' + categoryId.toString(),
        image: 'assets/thumbs/category/new.png',
        typeId: 1);
  }
}
