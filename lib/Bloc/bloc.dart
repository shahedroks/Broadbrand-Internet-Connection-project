
import 'package:flutter_bloc/flutter_bloc.dart';
part 'states.dart';
part 'event.dart';
class CounterBolc extends Bloc<CounterEvent,CounterState>{
  CounterBolc():super(CounterState(false,false)) {
    on<onPasswordChsk>((event, emit) {
      final numberRegexp = RegExp(r'[0-9]');
      var isPasswordEightCopy = state.isPasswordEight;
      var isPasswordOneCopy = state.isPasswordOne;
      if (event.password.length >= 8) {
        isPasswordEightCopy = true;
        print('ok');
      }
      else {
      }
      if (numberRegexp.hasMatch(event.password)) {
        isPasswordOneCopy = true;
      }
      else {
      }
      emit(CounterState(false, false));
    }
    );
  }
}