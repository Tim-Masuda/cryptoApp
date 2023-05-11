import 'package:proj_api/repositories/crypto_coins/models/crypto_coin_model.dart';

abstract class AbsctractCoinsRepository {
  Future<List<CryptoCoin>> getCoins();
}
