import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/data/repository/crypto_repository_impl.dart';
import 'package:getx_crypto_app/features/crypto/domain/repository/crypto_repository.dart';

class AddAssetViewModel extends GetxController {
  final CryptoRepository cryptoRepository = CryptoRepositoryImpl();

  RxBool loading = false.obs;
  RxList assetsList = <String>[].obs;
  RxString selectedAsset = "".obs;
  RxDouble assetValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _getCoinsName();
  }

  Future<void> _getCoinsName() async {
    loading.value = true;
    try {
      var responseData = await cryptoRepository.getCurrenciesData();
      responseData.forEach((element) {
        assetsList.add(element.name);
      });
      selectedAsset.value = assetsList.first;
    } catch (e) {
      throw Exception("Error getting coins data in add asset view model");
    } finally {
      loading.value = false;
    }
  }
}
