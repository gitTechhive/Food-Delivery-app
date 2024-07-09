
import 'package:get/get.dart';

class FoodLanguageController extends GetxController {

  // RxList<String> languageList =["English (US)","English (UK)","Mandarin","Hindi","Spanish","French","Arabic","Bengali","Russian","Indonesia"].obs;
  var selectedLanguage = "English (US)".obs;

  void setSelectedLanguage(String language) {
    selectedLanguage.value = language;
  }

}