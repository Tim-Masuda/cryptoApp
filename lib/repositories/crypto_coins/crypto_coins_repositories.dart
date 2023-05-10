import 'package:dio/dio.dart';
import 'package:proj_api/repositories/crypto_coins/models/crypto_coin_model.dart';

class CryptoCoinsRepositories {
  Future<List<CryptoCoin>> getCoins() async {
    final response = await Dio().get( // BASE //
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,CAG,DOV,TON&tsyms=USD',
    );
    final myData = response.data as Map<String, dynamic>;  // оснонвная дата  //
    final mydataRAW = myData['RAW'] as Map<String, dynamic>; //  под датка, с RAW  //
    final myDataListNew = mydataRAW.entries.map((e) { //  сортируем исходник и расскидываем по полям   //
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>; //  получаем данные от usdData  //
      final price = usdData['PRICE']; 
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        priceUSD: price,
        imageUrl:'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();

    return myDataListNew;
  }
}
