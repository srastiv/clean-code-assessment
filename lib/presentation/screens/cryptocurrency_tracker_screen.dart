import 'package:cryptocurrency_tracker/core/string_constants.dart';
import 'package:cryptocurrency_tracker/data/data_source/crypto_data_source.dart';
import 'package:cryptocurrency_tracker/data/models/crypto_model.dart';
import 'package:flutter/material.dart';

class CryptocurrencyTrackerScreen extends StatefulWidget {
  const CryptocurrencyTrackerScreen({super.key});

  @override
  State<CryptocurrencyTrackerScreen> createState() =>
      _CryptocurrencyTrackerScreenState();
}

class _CryptocurrencyTrackerScreenState
    extends State<CryptocurrencyTrackerScreen> {
  final CryptoDataSource _cryptoService = CryptoDataSource();
  final String _currency = 'usd';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.cryptocurrencyTracker)),
      body: StreamBuilder<List<CryptoModel>>(
        stream: _cryptoService.streamCryptos(_currency),
        builder: (
          final BuildContext context,
          final AsyncSnapshot<List<CryptoModel>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${StringConstants.error}: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text(StringConstants.noDataAvailable));
          }

          final List<CryptoModel> cryptos = snapshot.data!;
          return ListView.builder(
            itemCount: cryptos.length,
            itemBuilder: (final BuildContext context, final int index) {
              final CryptoModel crypto = cryptos[index];
              return ListTile(
                title: Text(crypto.name),
                subtitle: Text(
                  '${StringConstants.price}: \$${crypto.price.toStringAsFixed(2)}',
                ),
                trailing: Text(
                  '${StringConstants.marketCap}: \$${crypto.marketCap.toStringAsFixed(2)}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
