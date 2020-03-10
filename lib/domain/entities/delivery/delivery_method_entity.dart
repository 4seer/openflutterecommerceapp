import 'package:openflutterecommerce/domain/entities/entity.dart';

class DeliveryMethodEntity extends Entity<int> {
  final String title;
  final double price;

  DeliveryMethodEntity(
    {int id, 
    this.title, 
    this.price}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id, 
      'title': title, 
      'price': price
    };
  }

  @override
  List<Object> get props => [
    id, 
    title, 
    price
  ];
}
