import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_wizard/flutter_wizard.dart';
import 'package:medboss/features/auth/application/auth_facade.dart';
import 'package:meta/meta.dart';

import '../../../../domain/params/sign_up_params.dart';
import '../steps/step_one_provider.dart';
import '../steps/step_two_provider.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> with WizardStep {
  SignUpBloc(this._authFacade) : super(SignUpInitial()) {
    on<SignUpEvent>(_handler);
  }

  FutureOr<void> _handler(SignUpEvent event, Emitter<SignUpState> emit) async {
    if (event is SignUpSubmitted) {
      await _mapSubmitted(emit);
    } else if (event is SignUpCanceled) {
      _mapSignUpCanceled();
    }
  }

  final AuthFacade _authFacade;
  final StepOneProvider stepOneProvider = StepOneProvider();
  final StepTwoProvider stepTowProvider = StepTwoProvider();

  void _mapSignUpCanceled() {
    final state = this.state;
    if (state is SignUpLoading) {
      state.params.cancelToken.cancel();
    }
  }

  Future<void> _mapSubmitted(Emitter<SignUpState> emit) async {
    Map<String, dynamic> map = {}
      ..addAll(stepOneProvider.form.value)
      ..addAll(stepTowProvider.form.value);

    final params = SignUpParams.fromMap(map);
    emit(SignUpLoading(params));

    final result = await _authFacade.signUp(params);
    result.when(
      success: (data) => emit(SignUpSuccess()),
      failure: (e) => emit(SignUpFailure(e.message)),
    );
  }

  @override
  Future<void> close() {
    stepOneProvider.dispose();
    stepTowProvider.dispose();
    return super.close();
  }
}
