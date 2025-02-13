import 'package:dio/dio.dart';
import 'package:getx_crypto_app/core/constants/consts.dart';
import 'package:getx_crypto_app/features/crypto/domain/models/coin_data_model.dart';

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

  Future<List<CoinDataModel>> fetchCurrenciesData() async {
    try {
      final response = await _dio.get("currencies");
      final body = response.data["data"];
      final coinData =
          (body as List).map((json) => CoinDataModel.fromJson(json)).toList();
      return coinData;
    } catch (e) {
      rethrow;
    }
  }

  String getCurrenciesIcons(String name) {
    return "https://raw.githubusercontent.com/ErikThiart/cryptocurrency-icons/refs/heads/master/128/${name}.png";
  }
}
