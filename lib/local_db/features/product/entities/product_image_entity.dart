import 'package:openflutterecommerce/local_db/entity.dart';

class ProductImageEntity extends Entity {
  final int id;
  final String title;
  final String thumb;
  final String image;

  ProductImageEntity({this.id, this.title, this.thumb, this.image});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'thumb': thumb, 'image': image};
  }

  @override
  List<Object> get props => [id, title, thumb, image];
}
