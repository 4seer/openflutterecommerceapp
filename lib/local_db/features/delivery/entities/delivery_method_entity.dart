import 'package:openflutterecommerce/local_db/entity.dart';

class DeliveryMethodEntity extends Entity {
  final int id;
  final String title;
  final double price;

  DeliveryMethodEntity({this.id, this.title, this.price});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'price': price};
  }

  @override
  List<Object> get props => [id, title, price];
}
