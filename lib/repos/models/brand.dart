import 'package:equatable/equatable.dart';

class Brand extends Equatable{
  final int id;
  final String title;

  Brand(this.id, this.title);
  
  @override
  List<Object> get props => [id, title];
}