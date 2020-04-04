import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/data/abstract/model/commerce_image.dart';
import 'package:openflutterecommerce/data/abstract/model/filter_rules.dart';
import 'package:openflutterecommerce/data/abstract/model/product.dart';
import 'package:openflutterecommerce/data/abstract/model/product_attribute.dart';
import 'package:openflutterecommerce/data/abstract/model/sort_rules.dart';
import 'package:openflutterecommerce/data/abstract/product_repository.dart';
import 'package:openflutterecommerce/domain/entities/extensions.dart';
import 'package:openflutterecommerce/domain/entities/product_attribute.dart';
import 'package:openflutterecommerce/domain/entities/query_utils.dart';
import 'package:openflutterecommerce/domain/local_database.dart';

class ProductLocalRepository implements ProductRepository {
  final LocalDatabase localDatabase;

  ProductLocalRepository(this.localDatabase);

  @override
  Future<Product> getProduct(int id) async {
    final result = await localDatabase.database
        .query('product', where: 'id = ?', whereArgs: [id]);
    if (result != null && result.isNotEmpty) {
      final List<CommerceImage> images = await _getImagesOfProduct(id);
      final properties = await _getProductProperties(id);
      final selectableAttributes = await _getSelectableAttributes(id);
      return LocalProduct.fromMap(
          result.first, images, properties, selectableAttributes);
    } else {
      return null;
    }
  }

  Future<List<CommerceImage>> _getImagesOfProduct(int id) async {
    final result = await localDatabase.database
        .query('commerceImage', where: 'productId = ?', whereArgs: [id]);
    if (result != null && result.isNotEmpty) {
      return result
          .map((resultItem) => LocalCommerceImage.fromMap(resultItem))
          .toList(growable: false);
    } else {
      return [CommerceImage.placeHolder()];
    }
  }

  Future<List<ProductAttribute>> _getSelectableAttributes(int productId) async {
    final result = await localDatabase.database
        .rawQuery(LocalProductAttribute.query_for_product_by_id, [productId]);
    if (result != null && result.isNotEmpty) {
      return result
          .fold(
              <List<Map<String, dynamic>>>[],
              (list, mapItem) => list.last == null ||
                      list.last['attributeId'] != mapItem['attributeId']
                  ? list.add([mapItem])
                  : list.last.add(mapItem))
          .map((subList) => LocalProductAttribute.fromMap(subList))
          .toList(growable: false);
    } else {
      return [];
    }
  }

  Future<Map<String, String>> _getProductProperties(int id) async {
    final result = await localDatabase.database
        .query('productProperty', where: 'productId=?', whereArgs: [id]);
    if (result != null && result.isNotEmpty) {
      return Map.fromEntries(result.map((resultItem) =>
          MapEntry(resultItem['propertyName'], resultItem['propertyValue'])));
    } else {
      return {};
    }
  }

  @override
  Future<List<Product>> getSimilarProducts(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size}) {
    // TODO: implement getSimilarProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts(
      {int pageIndex = 0,
      int pageSize = AppConsts.page_size,
      int categoryId = 0,
      SortRules sortRules = const SortRules(),
      FilterRules filterRules}) async {
    final String whereFilter =
        QueryUtils.formWherePart(categoryId, false, filterRules);
    final String order = QueryUtils.formOrderPart(sortRules);

    final List<
        Map<String,
            dynamic>> queryResult = await localDatabase.database.query(
        'SELECT a.id AS id, '
        'a.title AS title, '
        'a.shortDescription AS shortDescription, '
        'a.description AS description, '
        'a.isFavorite AS isFavorite, '
        'a.price AS price, '
        'a.discountPercent AS discountPercent, '
        'a.amountAvailable AS amountAvailable, '
        'a.created AS created, '
        'a.averageRating AS averageRating, '
        'a.ratingCount AS ratingCount, '
        'b.address AS address, '
        'b.altText AS altText, '
        'b.isLocal AS isLocal '
        'FROM (SELECT * FROM product $whereFilter $order LIMIT ${pageIndex * pageSize}, $pageSize}) AS a LEFT JOIN '
        '(SELECT * FROM commerceImage '
        'WHERE product.id = commerceImage.productId LIMIT 1) AS b '
        'ON a.id = b.productId');
    return queryResult
        .map((productInMap) => LocalProduct.fromMap(productInMap,
            [LocalCommerceImage.fromMap(productInMap)], null, null))
        .toList(growable: false);
  }

  @override
  Future<FilterRules> getPossibleFilterOptions(int categoryId) {
    // TODO: implement getPossibleFilterOptions
    return null;
  }
}
