import 'dart:convert';
import 'package:cryptocurrency_tracker/data/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoDataSource {
  final String apiUrl = 'https://api.coingecko.com/api/v3/coins/markets';

  /// Streams a list of cryptocurrencies for the specified currency.
  /// This method periodically fetches the latest cryptocurrency data
  /// from the CoinGecko API every 10 seconds.

  /// Returns a [Stream] of a list of [CryptoModel] objects.

  Stream<List<CryptoModel>> streamCryptos(final String currency) {
    return Stream.periodic(const Duration(seconds: 10))
        .asyncMap((final _) async {
      final http.Response response = await http.get(
        Uri.parse(
          '$apiUrl?vs_currency=$currency',
        ),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((final crypto) => CryptoModel.fromJson(crypto))
            .toList();
      } else {
        throw Exception('Failed to load cryptocurrencies');
      }
    });
  }
}
