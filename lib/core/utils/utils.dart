import 'package:get/get.dart';
import 'package:getx_crypto_app/features/crypto/data/data_source/remote/coin_data_source.dart';

Future<void> registerServices() async {
  Get.put(
    CoinDataSource(),
  );
}
