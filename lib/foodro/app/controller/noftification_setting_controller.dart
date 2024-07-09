import 'package:get/get.dart';

class FoodNotificationSettingController extends GetxController {
  var isGeneralNotification = true.obs;
  var isSound = true.obs;
  var isVibrate = false.obs;
  var isSpecialOffers = true.obs;
  var isPromoDiscount = false.obs;
  var isPayments = true.obs;
  var isCashback = true.obs;
  var isAppUpdates = true.obs;
  var isNewService = false.obs;
  var isNewTips = false.obs;

  // Method to toggle the switch state
  void toggleSwitch(bool newValue, RxBool switchValue) {
    switchValue.value = newValue;
  }
}
