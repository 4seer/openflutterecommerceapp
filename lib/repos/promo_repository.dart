import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/promo.dart';

class PromoRepository {
  List<Promo> getPromos(){
    return [
      Promo(
        daysLeft: 6, 
        discount: 15, 
        image: "assets/images/checkout/cart/promo_bg1.png", 
        promoCode: 'mypromocode2020', 
        title: 'Personal offer',
        textColor: AppColors.white
      ),
      Promo(
        daysLeft: 6, 
        discount: 22, 
        image: "assets/images/checkout/cart/promo_bg2.png", 
        promoCode: 'summer2020', 
        title: 'Summer Sale',
        textColor: AppColors.black
      ),
      Promo(
        daysLeft: 6, 
        discount: 15, 
        image: "assets/images/checkout/cart/promo_bg1.png", 
        promoCode: 'mypromocode2020', 
        title: 'Personal offer',
        textColor: AppColors.white
      )
    ];
  }
}