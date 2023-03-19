import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<int, int> {
  NavigationBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
