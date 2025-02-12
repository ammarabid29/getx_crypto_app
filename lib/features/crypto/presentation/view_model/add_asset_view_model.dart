import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/data/repository/crypto_repository_impl.dart';
import 'package:getx_crypto_app/features/crypto/domain/repository/crypto_repository.dart';

class AddAssetDialogController extends GetxController {
  RxBool loading = false.obs;
  final CryptoRepository cryptoRepository = CryptoRepositoryImpl();
  RxList assets = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getAssets();
  }

  Future<void> _getAssets() async {
    loading.value = true;
    try {
      var responseData = await cryptoRepository.fetchCurrencies();
      responseData.forEach((element) {
        assets.add(element.name);
      });
      print(assets.length);
    } catch (e) {
      throw Exception("Error getting coins data");
    } finally {
      loading.value = false;
    }
  }
}
