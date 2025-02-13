import 'package:getx_crypto_app/features/crypto/domain/models/coin_data_model.dart';

class ApiResponseModel {
  List<CoinDataModel>? coinData;
  Meta? meta;
  Status? status;

  ApiResponseModel({this.coinData, this.meta, this.status});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      coinData = <CoinDataModel>[];
      json['data'].forEach((v) {
        coinData!.add(CoinDataModel.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coinData != null) {
      data['data'] = coinData!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Meta {
  int? count;

  Meta({this.count});

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}

class Status {
  String? time;
  bool? success;
  int? code;
  String? message;
  int? responseTime;
  int? creditsCost;

  Status(
      {this.time,
      this.success,
      this.code,
      this.message,
      this.responseTime,
      this.creditsCost});

  Status.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    success = json['success'];
    code = json['code'];
    message = json['message'];
    responseTime = json['responseTime'];
    creditsCost = json['creditsCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    data['responseTime'] = responseTime;
    data['creditsCost'] = creditsCost;
    return data;
  }
}
