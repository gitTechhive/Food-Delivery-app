import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodro/foodro/food_theme/food_theme.dart';
import 'package:foodro/route/my_route.dart';
import 'package:foodro/theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final ThemeController controller = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: controller.isDarkMode ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
      controller.isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return Obx(
          () {
        return GetMaterialApp(
          // defaultTransition: Transition.downToUp,
          debugShowCheckedModeBanner: false,
          theme: controller.isDarkMode
              ? FoodTheme.foodDarkTheme
              : FoodTheme.foodLightTheme,
          getPages: MyRoute.routes,
          initialRoute: MyRoute.foodSplash,
          //home: FindNearestDoctors(),
        );
      },
      // ),
    );
  }
}

