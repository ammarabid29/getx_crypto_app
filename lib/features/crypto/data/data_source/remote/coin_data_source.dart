import 'package:dio/dio.dart';
import 'package:getx_crypto_app/core/constants/consts.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/coin_data.dart';

class CoinDataSource {
  final Dio _dio = Dio();

  CoinDataSource() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: "https://api.cryptorank.io/v1/",
      queryParameters: {
        "api_key": cryptoAPIKey,
      },
    );
  }

  Future<List<CoinData>> fetchCoinData() async {
    try {
      final response = await _dio
          .get("https://api.cryptorank.io/v1/currencies?api_key=$cryptoAPIKey");

      if (response.statusCode == 200) {
        final List<CoinData> coinData = [];
        response.data['data'].forEach((v) {
          coinData.add(CoinData.fromJson(v));
        });
        return coinData;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
