import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductImageEntity extends Entity<int> {
  final String title;
  final String thumb;
  final String image;

  ProductImageEntity({
    int id, 
    this.title, 
    this.thumb, 
    this.image}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'title': title, 
      'thumb': thumb, 
      'image': image};
  }

  @override
  List<Object> get props => [
    id, 
    title, 
    thumb, 
    image
  ];
}
