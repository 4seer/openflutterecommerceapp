import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openflutterecommerce/repos/models/user_order.dart';
import 'package:openflutterecommerce/repos/order_repository.dart';
import 'package:openflutterecommerce/screens/profile/profile_event.dart';
import 'package:openflutterecommerce/screens/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => ProfileInitialState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileMyOrders) {
      yield ProfileMyOrdersProcessingState();
      OrderRepository repo = OrderRepository();
      List<UserOrder> orders = repo.getMyOrders();
      yield ProfileMyOrdersState(
        orderData: orders
      );
    } else if (event is ProfileMyOrderDetails) {
      yield ProfileMyOrdersProcessingState();
      OrderRepository repo = OrderRepository();
      UserOrder order = repo.getOrderDetails();
      yield ProfileMyOrderDetailState(
        orderData: order
      );
    }
  }
}
