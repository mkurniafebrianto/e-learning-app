import 'package:e_learning/src/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/excercise/excercise_cubit.dart';
import '../widgets/excercises_section_widget.dart';
import '../widgets/no_excercise_section_widget.dart';

class ExcerciseScreen extends StatefulWidget {
  final String courseId;
  final String title;

  const ExcerciseScreen({
    super.key,
    required this.courseId,
    required this.title,
  });

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ExcerciseCubit>().getExcercises(widget.courseId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
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
      body: Scaffold(
        body: BlocBuilder<ExcerciseCubit, ExcerciseState>(
          builder: (context, state) {
            if (state is GetExcerciseSuccess) {
              if (state.excerciseList.isEmpty) {
                return const NoExcerciseSectionWidget();
              }
              return ExcercisesSectionWidget(
                  excerciseList: state.excerciseList);
            } else if (state is GetExcerciseError) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
