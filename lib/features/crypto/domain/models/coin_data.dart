class CoinData {
  int? id;
  int? rank;
  String? slug;
  String? name;
  String? symbol;
  String? category;
  String? type;
  double? volume24hBase;
  int? circulatingSupply;
  int? totalSupply;
  int? maxSupply;
  Values? values;
  String? lastUpdated;
  List<Tokens>? tokens;

  CoinData(
      {this.id,
      this.rank,
      this.slug,
      this.name,
      this.symbol,
      this.category,
      this.type,
      this.volume24hBase,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.values,
      this.lastUpdated,
      this.tokens});

  CoinData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    slug = json['slug'];
    name = json['name'];
    symbol = json['symbol'];
    category = json['category'];
    type = json['type'];
    volume24hBase = json['volume24hBase'];
    circulatingSupply = json['circulatingSupply'];
    totalSupply = json['totalSupply'];
    maxSupply = json['maxSupply'];
    values = json['values'] != null ? Values.fromJson(json['values']) : null;
    lastUpdated = json['lastUpdated'];
    if (json['tokens'] != null) {
      tokens = <Tokens>[];
      json['tokens'].forEach((v) {
        tokens!.add(Tokens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['slug'] = slug;
    data['name'] = name;
    data['symbol'] = symbol;
    data['category'] = category;
    data['type'] = type;
    data['volume24hBase'] = volume24hBase;
    data['circulatingSupply'] = circulatingSupply;
    data['totalSupply'] = totalSupply;
    data['maxSupply'] = maxSupply;
    if (values != null) {
      data['values'] = values!.toJson();
    }
    data['lastUpdated'] = lastUpdated;
    if (tokens != null) {
      data['tokens'] = tokens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  USD? uSD;

  Values({this.uSD});

  Values.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  int? volume24h;
  double? high24h;
  double? low24h;
  double? marketCap;
  double? percentChange24h;
  double? percentChange7d;
  double? percentChange30d;
  double? percentChange3m;
  double? percentChange6m;

  USD(
      {this.price,
      this.volume24h,
      this.high24h,
      this.low24h,
      this.marketCap,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange3m,
      this.percentChange6m});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume24h'];
    high24h = json['high24h'];
    low24h = json['low24h'];
    marketCap = json['marketCap'];
    percentChange24h = json['percentChange24h'];
    percentChange7d = json['percentChange7d'];
    percentChange30d = json['percentChange30d'];
    percentChange3m = json['percentChange3m'];
    percentChange6m = json['percentChange6m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume24h'] = volume24h;
    data['high24h'] = high24h;
    data['low24h'] = low24h;
    data['marketCap'] = marketCap;
    data['percentChange24h'] = percentChange24h;
    data['percentChange7d'] = percentChange7d;
    data['percentChange30d'] = percentChange30d;
    data['percentChange3m'] = percentChange3m;
    data['percentChange6m'] = percentChange6m;
    return data;
  }
}

class Tokens {
  String? tokenAddress;
  Platform? platform;

  Tokens({this.tokenAddress, this.platform});

  Tokens.fromJson(Map<String, dynamic> json) {
    tokenAddress = json['tokenAddress'];
    platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tokenAddress'] = tokenAddress;
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? slug;

  Platform({this.id, this.name, this.slug});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

