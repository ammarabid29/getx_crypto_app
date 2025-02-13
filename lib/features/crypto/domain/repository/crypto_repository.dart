import 'package:getx_crypto_app/features/crypto/domain/models/coin_data_model.dart';

abstract class CryptoRepository {
  Future<List<CoinDataModel>> getCurrenciesData();

  String getCurrenciesIcons(String name);
}
