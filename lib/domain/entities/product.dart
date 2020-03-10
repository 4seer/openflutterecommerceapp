import 'package:openflutterecommerce/data/fake_repositories/models/product_rating.dart';
import 'package:openflutterecommerce/domain/entities/entity.dart';

class Product extends Entity<int> {
  final String title;
  final ProductRating rating;

  Product(
    int id,
    this.title,
    this.rating,
  ) : super(id);

  bool hasRating() {
    return rating != null;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id
    };
  }
}
