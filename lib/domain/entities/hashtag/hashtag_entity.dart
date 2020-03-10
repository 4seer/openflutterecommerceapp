import 'package:openflutterecommerce/domain/entities/entity.dart';

class HashTagEntity extends Entity<int> {
  final String title;

  HashTagEntity({
    int id,
    this.title,
  }) : super(id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  List<Object> get props => [id, title];
}
