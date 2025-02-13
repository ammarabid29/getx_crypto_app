import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/data/repository/crypto_repository_impl.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/coin_data_model.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/tracked_coins_model.dart';
import 'package:getx_crypto_app/features/crypto/domain/repository/crypto_repository.dart';

class AssetsViewModel extends GetxController {
  final CryptoRepository cryptoRepository = CryptoRepositoryImpl();

  RxBool loading = false.obs;
  RxList<CoinDataModel> coinData = <CoinDataModel>[].obs;
  RxList<TrackedAssetsModel> trackedAssets = <TrackedAssetsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAssets();
  }

  Future<void> getAssets() async {
    loading.value = true;
    try {
      var responseData = await cryptoRepository.getCurrenciesData();
      coinData.value = responseData;
      loading.value = false;
    } catch (e) {
      throw Exception("Error getting coins data in assets view model");
    } finally {
      loading.value = false;
    }
  }

  void addTrackedAsset(String name, double amount) {
    trackedAssets.add(
      TrackedAssetsModel(name: name, amount: amount),
    );
    print(trackedAssets);
  }

  double getPortfolioValue() {
    if (coinData.isEmpty) {
      return 0.0;
    } else if (trackedAssets.isEmpty) {
      return 0.0;
    } else {
      print(trackedAssets.length);
      double value = 0.0;
      for (TrackedAssetsModel asset in trackedAssets) {
        value += getAssetPrice(asset.name!) * asset.amount!;
      }
      return value;
    }
  }

  double getAssetPrice(String name) {
    CoinDataModel? data = getCoinData(name);
    print("$data");
    return data?.values?.uSD?.price?.toDouble() ?? 0.0;
  }

  CoinDataModel? getCoinData(String name) {
    return coinData.firstWhereOrNull((e) => e.name == name);
  }

  String getCurrenciesIcons(String name) =>
      cryptoRepository.getCurrenciesIcons(name.toLowerCase());
}
