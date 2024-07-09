import 'package:foodro/foodro/constant/food_images.dart';
import 'package:get/get.dart';

import '../model/payment_method.dart';

class FoodPaymentMethodController extends GetxController {

  var whichScreen =Get.arguments;
  var selectedPayment = PaymentMethod(
          name: 'My Wallet',
          description: 'Pay with My Wallet',
          iconName: wallet1Icon)
      .obs;

  List<PaymentMethod> paymentMethods = [
    PaymentMethod(
        name: 'My Wallet',
        description: 'Pay with My Wallet',
        iconName: wallet1Icon),
    PaymentMethod(
        name: 'Credit Card',
        description: 'Pay with credit card',
        iconName: creditCardIcon),
    PaymentMethod(
        name: 'PayPal', description: 'Pay with PayPal', iconName: payPalIcon),
    PaymentMethod(
        name: 'Apple Pay',
        description: 'Pay with Apple Pay',
        iconName: appleIcon),
    PaymentMethod(
        name: 'Google Pay',
        description: 'Pay with Google Pay',
        iconName: googleIcon),
    PaymentMethod(
        name: 'Cash Money', description: 'Pay with Cash', iconName: cashIcon),
    // Add more payment methods as needed
  ];

  void selectPayment(PaymentMethod payment) {
    selectedPayment.value = payment;
  }

/*-----------------------For Wallet ----------------------------------------------*/
  var selectedWalletPayment = PaymentMethod(
          name: 'Credit Card',
          description: 'Pay with credit card',
          iconName: creditCardIcon)
      .obs;
  List<PaymentMethod> walletPaymentMethods = [
    PaymentMethod(
        name: 'Credit Card',
        description: 'Pay with credit card',
        iconName: creditCardIcon),
    PaymentMethod(
        name: 'PayPal', description: 'Pay with PayPal', iconName: payPalIcon),
    PaymentMethod(
        name: 'Apple Pay',
        description: 'Pay with Apple Pay',
        iconName: Get.isDarkMode?appleWhiteIcon:appleIcon),
    PaymentMethod(
        name: 'Google Pay',
        description: 'Pay with Google Pay',
        iconName: googleIcon),
    // Add more payment methods as needed
  ];

  void selectWalletPayment(PaymentMethod payment) {
    selectedWalletPayment.value = payment;
  }
}
