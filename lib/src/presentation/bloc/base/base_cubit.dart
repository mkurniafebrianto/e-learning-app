import 'package:bloc/bloc.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseState(featureIndex: 0));

  void changeFeature(int index) {
    emit(BaseState(featureIndex: index));
  }

  void resetFeature() {
    emit(BaseState(featureIndex: 0));
  }
}
