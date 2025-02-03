import 'package:get/get.dart';

class AddAssetDialogController extends GetxController {
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  _getAssets() async {
    loading.value = true;
    // await _coinDataSource.getAssets();
    loading.value = false;
  }
}
