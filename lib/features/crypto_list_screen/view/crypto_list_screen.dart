import 'package:flutter/material.dart';
import 'package:proj_api/features/crypto_list_screen/widgets/crypto_list_widget.dart';
import 'package:proj_api/repositories/crypto_coins/crypto_coins_repositories.dart';
import 'package:proj_api/repositories/crypto_coins/models/crypto_coin_model.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadcrypto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoChecker'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoListWidget(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadcrypto() async {
    _cryptoCoinsList = await CryptoCoinsRepositories().getCoins();
    setState(() {});
  }
}
