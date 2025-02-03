import 'package:getx_crypto_app/features/crypto/domain/models/coin_data.dart';

abstract class CryptoRepository {
  Future<List<CoinData>> fetchCurrencies();
}
