import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_api/app.dart';
import 'package:proj_api/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:proj_api/repositories/crypto_coins/crypto_coins_repositories.dart';

void main() {
  GetIt.I.registerSingleton<AbsctractCoinsRepository>(CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}
