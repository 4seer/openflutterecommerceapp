import 'package:openflutterecommerce/domain/entities/entity.dart';

class CategoryHashTagEntity extends Entity<int> {
  final int hashTagId;
  final int categoryId;

  CategoryHashTagEntity({int id, this.hashTagId, this.categoryId}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hashTagId': hashTagId,
      'categoryId': categoryId,
    };
  }

  @override
  List<Object> get props => [
    id, 
    hashTagId, 
    categoryId
  ];
}
