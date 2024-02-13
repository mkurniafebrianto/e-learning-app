import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/screens/excercise_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseData course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ExcerciseScreen(
                courseId: course.courseId ?? '',
                title: course.courseName ?? '',
              ))),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    course.urlCover ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.courseName ?? 'No Name',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      '0/50 Paket latihan soal',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF8E8E8E),
                      ),
                    ),
                    const SizedBox(height: 2),
                    const LinearProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
