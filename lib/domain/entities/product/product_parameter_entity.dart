import 'package:openflutterecommerce/domain/entities/entity.dart';

class ProductParameterEntity extends Entity<int> {
  final String title;

  ProductParameterEntity(
    {int id, 
    this.title}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  List<Object> get props => [
    id, 
    title
  ];
}
