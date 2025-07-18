import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_rheme_data.dart';
import '../../../../core/resources/responive.dart';
import 'widget/custom_crypto_currency_item.dart';
import 'widget/custom_title.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100, title: CustomTitle()),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomCryptoCurrencyItem();
        },
      ),
    );
  }
}
