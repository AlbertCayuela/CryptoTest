import 'package:flutter_application/enums.dart';

class CryptoCurrency {
  final int id;
  final int rank;
  final String name;
  final String symbol;
  final String slug;
  final double usdPrice;
  final CryptoType cryptoType;

  CryptoCurrency(
      {required this.id,
      required this.rank,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.usdPrice,
      required this.cryptoType});
}
