import 'package:getx_crypto_app/features/crypto/data/data_source/remote/coin_data_source.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/coin_data.dart';
import 'package:getx_crypto_app/features/crypto/domain/repository/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CoinDataSource _coinDataSource = CoinDataSource();

  @override
  Future<List<CoinData>> fetchCurrencies() {
    try {
      return _coinDataSource.fetchCoinData();
    } catch (e) {
      rethrow;
    }
  }
}
