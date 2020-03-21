import 'package:equatable/equatable.dart';

import 'commerce_image.dart';

class Category extends Equatable {
  final int id;
  final int parentId;
  final String name;
  final String description;
  final CommerceImage image;

  Category(this.id,
      {this.parentId = 0, this.name, this.description, this.image});

  @override
  List<Object> get props => [id, parentId, name, image, image];

  @override
  bool get stringify => true;
}
