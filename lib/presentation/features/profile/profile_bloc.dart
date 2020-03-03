import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/data/fake_repositories/models/user_order.dart';
import 'package:openflutterecommerce/data/fake_repositories/order_repository.dart';

import 'profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileMyOrdersEvent) {
      yield ProfileMyOrdersProcessingState();
      OrderRepository repo = OrderRepository();
      List<UserOrder> orders = repo.getMyOrders();
      yield ProfileMyOrdersState(
        orderData: orders
      );
    } else if (event is ProfileMyOrderDetailsEvent) {
      yield ProfileMyOrdersProcessingState();
      OrderRepository repo = OrderRepository();
      UserOrder order = repo.getOrderDetails(event.orderId);
      yield ProfileMyOrderDetailsState(
        orderData: order
      );
    }
  }
}
