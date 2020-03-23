import 'package:openflutterecommerce/data/fake_repositories/models/category.dart';
import 'package:openflutterecommerce/data/interfaces/category_repository.dart';

class FakeCategoryRepository extends CategoryRepository {
  @override
  List<Category> getCategories(CategoryType categoryType) {
    switch (categoryType) {
      case CategoryType.newItems:
        return [
          Category(
              id: 2,
              title: 'New closes',
              image: 'assets/thumbs/category/clothes.png',
              typeId: 1),
          Category(
              id: 3,
              title: 'New shoes',
              image: 'assets/thumbs/category/shoes.png',
              typeId: 1),
          Category(
              id: 4,
              title: 'New accessories',
              image: 'assets/thumbs/category/accessories.png',
              typeId: 1),
        ];
      case CategoryType.sale:
        return [
          Category(
              id: 5,
              title: 'Clothes for sale',
              image: 'assets/thumbs/category/clothes.png',
              typeId: 1),
          Category(
              id: 6,
              title: 'Shoes for sale',
              image: 'assets/thumbs/category/shoes.png',
              typeId: 1),
          Category(
              id: 7,
              title: 'Accessories for sale',
              image: 'assets/thumbs/category/accessories.png',
              typeId: 1),
        ];
      case CategoryType.general:
      default:
        return [
          Category(id: 10, title: 'Tops', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 11, title: 'Shirts & Blouses', image: 'assets/thumbs/category/clothes.png', typeId: 4),
          Category(id: 12, title: 'Cardigans & Sweaters', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 13, title: 'Knitwear', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 14, title: 'Blazers', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 15, title: 'Knitwear', image: 'assets/thumbs/category/clothes.png', typeId: 4),
          Category(id: 16, title: 'Blazers', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 17, title: 'Outerwear', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 18, title: 'Pants', image: 'assets/thumbs/category/clothes.png', typeId: 4),
          Category(id: 19, title: 'Jeans', image: 'assets/thumbs/category/accessories.png', typeId: 4),
          Category(id: 20, title: 'Shorts', image: 'assets/thumbs/category/clothes.png', typeId: 4),
          Category(id: 21, title: 'Skirts', image: 'assets/thumbs/category/clothes.png', typeId: 4),
          Category(id: 22, title: 'Dresses', image: 'assets/thumbs/category/clothes.png', typeId: 4),
        ];
    }
  }

  @override
  Category getCategoryDetails(int categoryId) {
    return Category(
        id: 1,
        title: 'Category ' + categoryId.toString(),
        image: 'assets/thumbs/category/new.png',
        typeId: 1);
  }
}
