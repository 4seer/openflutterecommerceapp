import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/order_repository.dart';

import 'profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileBloc() : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileMyOrdersEvent) {
      yield ProfileMyOrdersProcessingState();
      var repo = OrderRepository();
      var orders = repo.getMyOrders();
      yield ProfileMyOrdersState(orderData: orders);
    } else if (event is ProfileMyOrderDetailsEvent) {
      yield ProfileMyOrdersProcessingState();
      var repo = OrderRepository();
      var order = repo.getOrderDetails(event.orderId);
      yield ProfileMyOrderDetailsState(orderData: order);
    }
  }
}
