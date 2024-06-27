import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/text/textStyles/app_textstyles.dart';

class NutriciousInfoCar extends StatelessWidget {
  String info;
  String title;
  String? unit;
  NutriciousInfoCar(
      {required this.info, required this.title, this.unit, super.key});

  @override
  Widget build(BuildContext context) {
    final validUnit = unit ?? '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: ListTile(
        title: Text(
          '$title : $info $validUnit',
          style: AppTextStyles.nutriciousInfoCardText,
        ),
      ),
    );
  }
}
