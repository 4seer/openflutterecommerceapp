import 'package:openflutterecommerce/domain/entities/entity.dart';

class PromoCodeEntity extends Entity<int> {
  final String title;
  final String image;
  final String promoCode;
  final double discountPercent;
  final bool belongsToUser;
  final bool wasUsed;

  PromoCodeEntity(
    {int id,
    this.title,
    this.image,
    this.promoCode,
    this.discountPercent,
    this.belongsToUser,
    this.wasUsed}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'promoCode': promoCode,
      'discountPercent': discountPercent,
      'belongsToUser': belongsToUser,
      'wasUsed': wasUsed
    };
  }

  @override
  List<Object> get props =>
    [id, 
    title, 
    image, 
    promoCode, 
    discountPercent, 
    belongsToUser, 
    wasUsed
  ];
}
