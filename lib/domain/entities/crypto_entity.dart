class CryptoEntity {
  final String name;
  final double price;
  final double marketCap;
  final double volume;
  final double priceChange24h;

  CryptoEntity({
    required this.name,
    required this.price,
    required this.marketCap,
    required this.volume,
    required this.priceChange24h,
  });
}
