import 'package:e_learning/src/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/excercise/excercise_cubit.dart';

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
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
                shrinkWrap: true,
                itemCount: state.excerciseList.length,
                itemBuilder: (context, index) {
                  final excercise = state.excerciseList[index];

                  return Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ),
                              Text(
                                  '${excercise.jumlahDone}/${excercise.jumlahSoal} Soal'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
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
