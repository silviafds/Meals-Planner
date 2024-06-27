import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/entities/dishes.dart';
import '../../../core/text/textStyles/app_textstyles.dart';
import 'widgets/nutricious_info_card.dart';

class DishDetailsScreen extends StatefulWidget {
  final Dishes dish;
  const DishDetailsScreen({required this.dish, super.key});

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  final _nutriciousInfoList = {};

  @override
  void initState() {
    _nutriciousInfoList['categoria'] = widget.dish.categoria.toString();
    _nutriciousInfoList['peso'] = widget.dish.peso.toString();
    _nutriciousInfoList['calorias'] = widget.dish.calorias.toString();
    _nutriciousInfoList['carboidratos'] = widget.dish.carboidratos.toString();
    _nutriciousInfoList['gorduraSaturada'] =
        widget.dish.gorduraSaturada.toString();
    _nutriciousInfoList['gorduraTotais'] =
        widget.dish.gordurasTotais.toString();
    _nutriciousInfoList['proteinas'] = widget.dish.proteinas.toString();
    _nutriciousInfoList['sodio'] = widget.dish.sodio.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: SizedBox(
                          width: 400,
                          child: Text(
                            widget.dish.nome,
                            style: AppTextStyles.dishDetailsName,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Informações nutricionais:',
                          style: AppTextStyles.dishDetailsInfoTitle,
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: ListView(children: [
                    NutriciousInfoCar(
                        title: 'Categoria',
                        info: _nutriciousInfoList['categoria']),
                    NutriciousInfoCar(
                        title: 'Peso',
                        unit: 'g',
                        info: _nutriciousInfoList['peso']),
                    NutriciousInfoCar(
                        title: 'Calorias',
                        unit: 'kcal',
                        info: _nutriciousInfoList['calorias']),
                    NutriciousInfoCar(
                        title: 'Carboidratos',
                        unit: 'g',
                        info: _nutriciousInfoList['carboidratos']),
                    NutriciousInfoCar(
                        title: 'Gordura Saturada',
                        unit: 'g',
                        info: _nutriciousInfoList['gorduraSaturada']),
                    NutriciousInfoCar(
                        title: 'Gordura Totais',
                        unit: 'g',
                        info: _nutriciousInfoList['gorduraTotais']),
                    NutriciousInfoCar(
                        title: 'Proteinas',
                        unit: 'g',
                        info: _nutriciousInfoList['proteinas']),
                    NutriciousInfoCar(
                        title: 'Sodio',
                        unit: 'g',
                        info: _nutriciousInfoList['sodio']),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                )
              ],
            ),
          ),
          Positioned(
            child: IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                )),
          )
        ]),
      ),
    );
  }
}
