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
      final response = await _dio.get("currencies");
      if (response.statusCode == 200) {
        final body = response.data["data"];
        final coinData =
            (body as List).map((json) => CoinData.fromJson(json)).toList();
        return coinData;
      } else {
        throw Exception("Error getting coin data");
      }
    } catch (e) {
      rethrow;
    }
  }
}
