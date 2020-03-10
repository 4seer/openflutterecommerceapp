import 'package:openflutterecommerce/domain/entities/entity.dart';

class UserEntity extends Entity<int> {
  final String name;
  final String avatar;
  final String email;
  final String password;
  final String birthDate;
  final bool salesNotification;
  final bool newArrivalsNotification;
  final bool deliveryStatusChanges;

  UserEntity(
    {int id,
    this.name,
    this.avatar,
    this.email,
    this.password,
    this.birthDate,
    this.salesNotification,
    this.newArrivalsNotification,
    this.deliveryStatusChanges}) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'password': password,
      'birthDate': birthDate,
      'salesNotification': salesNotification,
      'newArrivalsNotification': newArrivalsNotification,
      'deliveryStatusChanges': deliveryStatusChanges
    };
  }

  @override
  List<Object> get props => [
    id,
    name,
    avatar,
    email,
    password,
    birthDate,
    salesNotification,
    newArrivalsNotification,
    deliveryStatusChanges
  ];
}
