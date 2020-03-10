import 'package:openflutterecommerce/domain/entities/entity.dart';

class Category extends Entity<int> {
  Category(int id) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id
    };
  }

  @override
  List<Object> get props => [];
}
