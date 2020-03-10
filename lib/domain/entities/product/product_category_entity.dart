import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductCategoryEntity extends Entity<int> {
  final String title;
  final String description;
  final String image;
  final String thumb;
  final int parentId;

  ProductCategoryEntity(
    {int id,
    this.title,
    this.description,
    this.image,
    this.thumb,
    this.parentId}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'thumb': thumb,
      'parentId': parentId
    };
  }

  @override
  List<Object> get props => [
    id, 
    title, 
    description, 
    image, 
    thumb, 
    parentId
  ];
}
