import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductCategoryEntity extends Entity<int> {
  final String title;
  final String description;
  final String image;
  final String thumb;
  final int parentId;
  final int orderNumber;
  final int count;

  ProductCategoryEntity(
    {int id,
    this.title,
    this.description,
    this.image,
    this.thumb,
    this.parentId,
    this.orderNumber,
    this.count}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'thumb': thumb,
      'parentId': parentId,
      'orderNumber': orderNumber,
      'count':count
    };
  }

  @override
  List<Object> get props => [
    id, 
    title, 
    description, 
    image, 
    thumb, 
    parentId,
    orderNumber,
    count
  ];
}
