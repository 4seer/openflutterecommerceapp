/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see shipping_address_repository_impl.dart
 */
import 'package:openflutterecommerce/data/model/payment_method.dart';
import 'package:openflutterecommerce/data/repositories/abstract/payment_method_repository.dart';
import 'package:openflutterecommerce/data/repositories/fake_repos/payment_method_repository.dart';

class PaymentMethodRepositoryImpl implements PaymentMethodRepository{

  final PaymentMethodDataStorage dataStorage;

  PaymentMethodRepositoryImpl(this.dataStorage);


  @override
  Future addPaymentMethod(PaymentMethodModel shippingAddress) {
      // TODO: implement addPaymentMethod
      throw UnimplementedError();
    }
  
    @override
    Future<List<PaymentMethodModel>> getPaymentMethodList() async {
       if ( dataStorage.paymentMethods?.isEmpty ) {
        FakePaymentMethodRepository repo = FakePaymentMethodRepository();
        dataStorage.paymentMethods = await repo.getPaymentMethodList();
      }
      return dataStorage.paymentMethods;
    }
  
    @override
    Future removePaymentMethod(int paymentMethodId) async {
      dataStorage.paymentMethods.removeWhere(
        (paymentMethods) => paymentMethods.id == paymentMethodId );
    }
  
    @override
  Future setDefaultPaymentMethod(int paymentMethodId) async {
    List<PaymentMethodModel> paymentMethods = dataStorage.paymentMethods;
    dataStorage.paymentMethods.clear();
    paymentMethods.forEach((paymentMethod) {
      dataStorage.paymentMethods.add(
        paymentMethod
          .copyWith(
            isDefault: paymentMethod.id == paymentMethodId 
          )
      );
    });
  }

  @override
  Future<PaymentMethodModel> getDefaultPaymentMethod() async {
    PaymentMethodModel paymentMethod = 
      await dataStorage.paymentMethods.firstWhere((paymentMethod) => paymentMethod.isDefault);
    return paymentMethod;
  }
}