import 'package:proj_api/features/crypto_list_screen/view/crypto_list_screen.dart';
import 'package:proj_api/features/crypto_single_screen/view/crypto_single_screen.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
