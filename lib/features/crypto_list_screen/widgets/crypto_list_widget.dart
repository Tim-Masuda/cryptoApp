import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proj_api/repositories/crypto_coins/models/crypto_coin_model.dart';

class CryptoListWidget extends StatelessWidget {
  const CryptoListWidget({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl), 
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin', 
          arguments: coin,
        );
      },
    );
  }
}
