import 'package:openflutterecommerce/data/abstract/category_repository.dart';

import 'models/category.dart';

class FakeCategoryRepository extends CategoryRepository {
  static const ID_NEW = 31;
  static const ID_SALE = 32;
  static const ID_GENERAL = 33;

  @override
  Future<List<FakeCategory>> getCategories({int parentCategoryId = 0}) async {
    return _categories
        .where((element) => element.parentId == parentCategoryId)
        .toList();
  }

  @override
  Future<FakeCategory> getCategoryDetails(int categoryId) async {
    return _categories.firstWhere((element) => element.id == categoryId);
  }

  final _categories = [
    FakeCategory(
      id: ID_NEW,
      name: 'New items',
      isCategoryContainer: true,
      localImage: 'assets/thumbs/category/clothes.png',
    ),
    FakeCategory(
      id: ID_SALE,
      name: 'Sale',
      isCategoryContainer: true,
      localImage: 'assets/thumbs/category/clothes.png',
    ),
    FakeCategory(
      id: 1,
      parentId: ID_NEW,
      name: 'New shoes',
      localImage: 'assets/thumbs/category/shoes.png',
    ),
    FakeCategory(
      id: 8,
      parentId: ID_NEW,
      name: 'New accessories',
      localImage: 'assets/thumbs/category/accessories.png',
    ),
    FakeCategory(
      id: 2,
      parentId: ID_NEW,
      name: 'New closes',
      localImage: 'assets/thumbs/category/clothes.png',
    ),
    FakeCategory(
      id: 3,
      name: 'Shoes',
      localImage: 'assets/thumbs/category/shoes.png',
    ),
    FakeCategory(
      id: 4,
      name: 'Accessories',
      localImage: 'assets/thumbs/category/accessories.png',
    ),
    FakeCategory(
      id: 5,
      parentId: ID_SALE,
      name: 'Clothes for sale',
      localImage: 'assets/thumbs/category/clothes.png',
    ),
    FakeCategory(
      id: 6,
      parentId: ID_SALE,
      name: 'Shoes for sale',
      localImage: 'assets/thumbs/category/shoes.png',
    ),
    FakeCategory(
      id: 7,
      parentId: ID_SALE,
      name: 'Accessories for sale',
      localImage: 'assets/thumbs/category/accessories.png',
    ),
    FakeCategory(id: 10, name: 'Tops', localImage: ''),
    FakeCategory(id: 11, name: 'Shirts & Blouses', localImage: ''),
    FakeCategory(id: 12, name: 'Cardigans & Sweaters', localImage: ''),
    FakeCategory(id: 13, name: 'Knitwear', localImage: ''),
    FakeCategory(id: 14, name: 'Blazers', localImage: ''),
    FakeCategory(id: 15, name: 'Knitwear', localImage: ''),
    FakeCategory(id: 16, name: 'Blazers', localImage: ''),
    FakeCategory(id: 17, name: 'Outerwear', localImage: ''),
    FakeCategory(id: 18, name: 'Pants', localImage: ''),
    FakeCategory(id: 19, name: 'Jeans', localImage: ''),
    FakeCategory(id: 20, name: 'Shorts', localImage: ''),
    FakeCategory(id: 21, name: 'Skirts', localImage: ''),
    FakeCategory(id: 22, name: 'Dresses', localImage: ''),
  ];
}
