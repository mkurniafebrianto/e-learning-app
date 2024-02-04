import 'package:flutter/material.dart';

import '../../domain/entities/excercise_model.dart';
import 'excercise_card.dart';

class ExcercisesSectionWidget extends StatelessWidget {
  final List<ExcerciseData> excerciseList;

  const ExcercisesSectionWidget({
    super.key,
    required this.excerciseList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih Paket Soal',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.35,
            ),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: excerciseList.length,
            itemBuilder: (context, index) {
              final excercise = excerciseList[index];

              return ExcerciseCard(excercise: excercise);
            },
          ),
        ],
      ),
    );
  }
}
