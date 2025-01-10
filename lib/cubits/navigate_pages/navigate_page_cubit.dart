import 'package:flutter_bloc/flutter_bloc.dart';

class NavigatePageCubit extends Cubit<int> {
  NavigatePageCubit() : super((0));

  void updateIndex(int index) {
    emit(index);
  }
}
