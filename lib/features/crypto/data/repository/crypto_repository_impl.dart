import 'package:getx_crypto_app/features/crypto/data/data_source/remote/coin_data_source.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/coin_data_model.dart';
import 'package:getx_crypto_app/features/crypto/domain/repository/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CoinDataSource _coinDataSource = CoinDataSource();

  @override
  Future<List<CoinDataModel>> getCurrenciesData() {
    try {
      return _coinDataSource.fetchCurrenciesData();
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getCurrenciesIcons(String name) =>
      _coinDataSource.getCurrenciesIcons(name);
}
