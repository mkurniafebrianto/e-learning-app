import 'package:e_learning/src/presentation/screens/course_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/course_model.dart';
import 'course_card.dart';

class HomeCourseList extends StatelessWidget {
  final List<CourseData> courses;

  const HomeCourseList({
    super.key,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pilih Pelajaran',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(courseList: courses),
                  ),
                );
              },
              child: const Text(
                'Lihat Semua',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final course = courses[index];

            return CourseCard(course: course);
          },
        ),
      ],
    );
  }
}
