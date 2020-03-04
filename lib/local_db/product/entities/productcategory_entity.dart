import 'package:openflutterecommerce/local_db/entity.dart';

class ProductCategoryEntity extends Entity {
  final int id;
  final String title;
  final String description;
  final String image;
  final String thumb;
  final int parentId;

  ProductCategoryEntity(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.thumb,
      this.parentId});

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': this.description,
      'image': image,
      'thumb': thumb,
      'parentId': parentId
    };
  }

  @override
  List<Object> get props => [id, title, description, image, thumb, parentId];
}
