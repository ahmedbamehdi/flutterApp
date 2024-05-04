// controller/splace_controller.dart
import 'package:get/get.dart';
// ignore: unused_import
import 'package:smart_car_parking/pages/LoginPage.dart';
import 'package:smart_car_parking/pages/homepage/homepage.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pageHander();
  }

  void pageHander() async {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        //Get.offAllNamed("/map-page");
        //  Get.offAll(LoginPage());
        Get.offAll(HomePage() );
        update();
      },
    );
  }
}
