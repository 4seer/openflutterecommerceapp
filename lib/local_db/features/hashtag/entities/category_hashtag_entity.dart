import 'package:openflutterecommerce/local_db/entity.dart';

class CategoryHashTagEntity extends Entity {
  final int id;
  final int hashTagId;
  final int categoryId;

  CategoryHashTagEntity({this.id, this.hashTagId, this.categoryId});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hashTagId': hashTagId,
      'categoryId': categoryId,
    };
  }

  @override
  List<Object> get props => [id, hashTagId, categoryId];
}
