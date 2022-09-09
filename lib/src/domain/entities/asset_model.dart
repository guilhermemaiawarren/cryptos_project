import 'package:flutter/material.dart';

class AssetModel {
  String id;
  int serialId;
  String symbol;
  String name;
  double price;
  double variation;
  IconData icon;
  double coinBalance;
  AssetModel({
    required this.id,
    required this.serialId,
    required this.symbol,
    required this.name,
    required this.price,
    required this.variation,
    required this.icon,
    required this.coinBalance,
  });
}
