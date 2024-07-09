import 'package:foodro/foodro/app/views/checkout_order/food_checkout_order_screen.dart';
import 'package:foodro/foodro/app/views/food_location/food_location_screen.dart';
import 'package:foodro/foodro/app/views/home/food_main_home_screen.dart';
import 'package:foodro/foodro/app/views/home/food_resturant_list/food_restaurant_list_screen.dart';
import 'package:foodro/foodro/app/views/home/more_category/food_more_category_screen.dart';
import 'package:foodro/foodro/app/views/otp/food_otp_screen.dart';
import 'package:foodro/foodro/app/views/profile/food_profile_screen.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/food_restaurant_detail_screen.dart';
import 'package:foodro/foodro/app/views/signin/food_signin_screen.dart';
import 'package:foodro/foodro/app/views/signup/food_signup_screen.dart';
import 'package:foodro/foodro/app/views/splash/food_splash_screen.dart';
import 'package:foodro/foodro/app/views/walkthrough/food_walkthrough_screen.dart';
import 'package:foodro/foodro/app/views/welcome/welcome_screen.dart';
import 'package:foodro/foodro/app/views/welcome_signin/welcome_signin_screen.dart';
import 'package:get/get.dart';

import '../foodro/app/views/address/food_address_screen.dart';
import '../foodro/app/views/chat/food_chat_screen.dart';
import '../foodro/app/views/discount/food_discount_screen.dart';
import '../foodro/app/views/driver_location/cancel_order_screen.dart';
import '../foodro/app/views/driver_location/driver_information_screen.dart';
import '../foodro/app/views/driver_location/driver_location_map_view.dart';
import '../foodro/app/views/e_wallet/food_to_up_wallet_screen.dart';
import '../foodro/app/views/e_wallet/food_wallet_payment_screen.dart';
import '../foodro/app/views/e_wallet/food_wallet_transaction_history.dart';
import '../foodro/app/views/home/food_recommended_screen.dart';
import '../foodro/app/views/home/food_special_offer_screen.dart';
import '../foodro/app/views/notification/food_notification_screen.dart';
import '../foodro/app/views/payment/food_payment_method_screen.dart';
import '../foodro/app/views/rating/rating_driver_screen.dart';
import '../foodro/app/views/search/food_default_search_screen.dart';
import '../foodro/app/views/search/food_search_result_screen.dart';
import '../foodro/app/views/setting/food_customer_service.dart';
import '../foodro/app/views/setting/food_edit_profile.dart';
import '../foodro/app/views/setting/food_help_center_screen.dart';
import '../foodro/app/views/setting/food_invite_friend_screen.dart';
import '../foodro/app/views/setting/food_language_screen.dart';
import '../foodro/app/views/setting/food_my_fav_restaurant_screen.dart';
import '../foodro/app/views/setting/notification_setting_screen.dart';

class MyRoute {

  /*------------------------------ food App -------------------------------------------*/
  static const foodSplash = '/food_splash';
  static const foodWelcome = '/food_welcome';
  static const foodWalkthrough = '/food_walkthrough';
  static const foodWelcomeLogin = '/food_welcome_login';
  static const foodSignup = '/food_signup';
  static const foodSignIn = '/food_signIn';
  static const foodOtp = '/food_otp';
  static const foodProfile = '/food_profile';
  static const foodLocation = '/food_location';
  static const foodHome = '/food_home';
  static const foodRecommended = '/food_recommended_screen';
  static const foodMoreCat = '/food_more_category';
  static const foodRestaurantList = '/food_restaurant_list';
  static const foodRestaurantDetail = '/food_restaurant_detail';
  static const foodCheckOut = '/food_checkout';
  static const foodAddress = '/food_address';
  static const foodPaymentMethod = '/food_payment_method';
  static const foodDiscount = '/food_discount';
  static const foodDriverLocation = '/food_driver_location';
  static const foodDriverDetail = '/food_driver_detail';
  static const foodChat = '/food_chat';
  static const foodRatingDriver = '/food_rating_driver';
  static const foodCancelOrder = '/food_cancel_order';
  static const foodTransactionHistory = '/food_transaction_history';
  static const foodWalletTopUp = '/food_wallet_top_up';
  static const foodWalletPayment = '/food_wallet_payment';
  static const foodNotification = '/food_notification';
  static const foodSpecialOffer = '/food_special_offer';
  static const foodNotificationSetting = '/food_notification_setting';
  static const foodFavRestaurant = '/food_fav_restaurant';
  static const foodEditProfile = '/food_edit_profile';
  static const foodLanguage = '/food_language';
  static const foodInviteFriends = '/food_invite_friends';
  static const foodHelpCenter = '/food_help_center';
  static const foodCustomerService = '/food_customer_service';
  static const foodDefaultSearch = '/food_default_search';
  static const foodSearchResult = '/food_search_reslut';

  /*-------------------------------------------------------------------------*/


  static final routes = [
    /*------------------------------ food App -------------------------------------------*/
    GetPage(
      name: foodSplash,
      page: () => const FoodSplashScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodWelcome,
      page: () => const FoodWelcomeScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodWalkthrough,
      page: () => const FoodWalkThroughScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodWelcomeLogin,
      page: () => const FoodWelcomeSignInScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodSignup,
      page: () => const FoodSignupScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodSignIn,
      page: () => const FoodSignInScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodOtp,
      page: () => const FoodOtpScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodProfile,
      page: () => const FoodProfileScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodLocation,
      page: () => const FoodLocationScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(name: foodHome, page: () => const FoodMainHomeScreen()),
    GetPage(name: foodRecommended, page: () => const FoodRecommendedScreen()),
    GetPage(
      name: foodMoreCat,
      page: () => const FoodMoreCategoryScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodRestaurantList,
      page: () => const FoodRestaurantListScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodRestaurantDetail,
      page: () => const FoodRestaurantDetail(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodCheckOut,
      page: () => const FoodCheckoutScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodAddress,
      page: () => const FoodDeliveryAddressScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodPaymentMethod,
      page: () => const FoodPaymentMethodScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodDiscount,
      page: () => const FoodDiscountScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodDriverLocation,
      page: () => const DriverLocationMapView(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodDriverDetail,
      page: () => const DriverInformationScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodChat,
      page: () => const FoodChatScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodRatingDriver,
      page: () => const RattingDriverScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodCancelOrder,
      page: () => const CancelOrderScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodTransactionHistory,
      page: () => const FoodTransactionHistoryScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodWalletTopUp,
      page: () => const FoodWalletTopUpScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodWalletPayment,
      page: () => const FoodWalletPaymentScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodNotification,
      page: () => const FoodNotificationScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodSpecialOffer,
      page: () => const FoodSpecialOfferScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodNotificationSetting,
      page: () => const NotificationSettingScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodFavRestaurant,
      page: () => const FoodMyFavRestaurantScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodEditProfile,
      page: () => const FoodEditProfileScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodLanguage,
      page: () => const LanguageListView(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodInviteFriends,
      page: () => const FoodInviteFriendsScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodHelpCenter,
      page: () => const FoodHelpCenterScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodCustomerService,
      page: () => const FoodCustomerServiceScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodDefaultSearch,
      page: () => const FoodDefaultSearchScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: foodSearchResult,
      page: () => const FoodSearchResultScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 600),
    ),
/*-------------------------------------------------------------------------*/
  ];
}
