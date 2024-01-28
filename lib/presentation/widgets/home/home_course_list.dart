import 'package:e_learning/data/model/course/course_model.dart';
import 'package:flutter/material.dart';

class HomeCourseList extends StatelessWidget {
  final List<CourseData> courses;

  const HomeCourseList({super.key, required this.courses});

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
              onPressed: () {},
              child: const Text(
                'Lihat Semua',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final course = courses[index];

            return Container(
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
                      child: Image.network(
                        course.urlCover ?? '',
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox.shrink(),
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
                            ),
                          ),
                          const LinearProgressIndicator(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
