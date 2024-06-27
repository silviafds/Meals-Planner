import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/entities/dishes.dart';
import '../../../../core/text/textStyles/app_textstyles.dart';

class DishCard extends StatelessWidget {
  Dishes dish;
  DishCard({required this.dish, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.mainColor,
      child: SizedBox(
        width: 100,
        height: 430,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 250,
            ),
            Positioned(
              top: 260,
              left: 20,
              child: SizedBox(
                width: 200,
                child: Text(
                  dish.nome,
                  style: AppTextStyles.dishCardNameTextStyle,
                ),
              ),
            ),
            Positioned(
              top: 260,
              right: 30,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 40,
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                'Calorias: ${dish.calorias}kcal',
                style: AppTextStyles.dishCardCaloriesTextStyle,
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Text(
                'Peso: ${dish.peso}g',
                style: AppTextStyles.dishCardCaloriesTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
