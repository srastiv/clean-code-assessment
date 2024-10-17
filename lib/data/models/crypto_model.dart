import 'package:cryptocurrency_tracker/domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({
    required super.name,
    required super.price,
    required super.marketCap,
    required super.volume,
    required super.priceChange24h,
  });

  factory CryptoModel.fromJson(final Map<String, dynamic> json) {
    return CryptoModel(
      name: json['name'],
      price: (json['current_price'] is int)
          ? (json['current_price'] as int).toDouble()
          : json['current_price'],
      marketCap: (json['market_cap'] is int)
          ? (json['market_cap'] as int).toDouble()
          : json['market_cap'],
      volume: (json['total_volume'] is int)
          ? (json['total_volume'] as int).toDouble()
          : json['total_volume'],
      priceChange24h: (json['price_change_percentage_24h'] is int)
          ? (json['price_change_percentage_24h'] as int).toDouble()
          : json['price_change_percentage_24h'],
    );
  }
}
