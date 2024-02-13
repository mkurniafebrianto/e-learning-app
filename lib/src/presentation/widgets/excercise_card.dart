import 'package:e_learning/src/core/styles.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/excercise_model.dart';

class ExcerciseCard extends StatelessWidget {
  const ExcerciseCard({
    super.key,
    required this.excercise,
  });

  final ExcerciseData excercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 53,
              height: 53,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F7F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  excercise.icon ?? '',
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  excercise.exerciseTitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle(
                    textFont: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${excercise.jumlahDone}/${excercise.jumlahSoal} Soal',
                  style: Styles.textStyle(
                      textFont: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8E8E8E)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
