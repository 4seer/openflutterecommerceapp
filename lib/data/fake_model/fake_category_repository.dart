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
      parentId: ID_GENERAL,
      name: 'Shoes',
      localImage: 'assets/thumbs/category/shoes.png',
    ),
    FakeCategory(
      id: 4,
      parentId: ID_GENERAL,
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
    FakeCategory(id: 10, parentId: ID_GENERAL, name: 'Tops', localImage: ''),
    FakeCategory(
        id: 11, parentId: ID_GENERAL, name: 'Shirts & Blouses', localImage: ''),
    FakeCategory(
        id: 12,
        parentId: ID_GENERAL,
        name: 'Cardigans & Sweaters',
        localImage: ''),
    FakeCategory(
        id: 13, parentId: ID_GENERAL, name: 'Knitwear', localImage: ''),
    FakeCategory(id: 14, parentId: ID_GENERAL, name: 'Blazers', localImage: ''),
    FakeCategory(
        id: 15, parentId: ID_GENERAL, name: 'Knitwear', localImage: ''),
    FakeCategory(id: 16, parentId: ID_GENERAL, name: 'Blazers', localImage: ''),
    FakeCategory(
        id: 17, parentId: ID_GENERAL, name: 'Outerwear', localImage: ''),
    FakeCategory(id: 18, parentId: ID_GENERAL, name: 'Pants', localImage: ''),
    FakeCategory(id: 19, parentId: ID_GENERAL, name: 'Jeans', localImage: ''),
    FakeCategory(id: 20, parentId: ID_GENERAL, name: 'Shorts', localImage: ''),
    FakeCategory(id: 21, parentId: ID_GENERAL, name: 'Skirts', localImage: ''),
    FakeCategory(id: 22, parentId: ID_GENERAL, name: 'Dresses', localImage: ''),
  ];
}
