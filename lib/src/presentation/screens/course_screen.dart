import 'package:e_learning/src/core/values/colors.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/course_model.dart';
import '../widgets/course_card.dart';

class CourseScreen extends StatelessWidget {
  final List<CourseData> courseList;

  const CourseScreen({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Pelajaran',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        surfaceTintColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) =>
              CourseCard(course: courseList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: courseList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
