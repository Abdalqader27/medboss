import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medboss/features/auth/application/auth_facade.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../domain/params/login_params.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authFacade) : super(LoginInitial()) {
    on<LoginEvent>(_handler);
  }

  static const phoneNumberControllerName = 'phoneNumber';
  static const passwordControllerName = 'password';

  final FormGroup form = FormGroup(
    {
      phoneNumberControllerName: FormControl(
        validators: [Validators.required],
      ),
      passwordControllerName: FormControl(
        validators: [Validators.required],
      ),
    },
  );

  final AuthFacade _authFacade;

  FutureOr<void> _handler(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginSubmitted) {
      await _mapSubmitted(emit);
    } else if (event is LoginCanceled) {
      _mapLoginCanceled();
    }
  }

  void _mapLoginCanceled() {
    final state = this.state;
    if (state is LoginLoading) {
      state.params.cancelToken.cancel();
    }
  }

  Future<void> _mapSubmitted(Emitter<LoginState> emit) async {
    if (form.valid) {
      final loginParams = LoginParams.fromMap(form.value);
      emit(LoginLoading(loginParams));
      form.unfocus();
      final result = await _authFacade.login(loginParams);
      result.when(
        success: (data) => emit(LoginSuccess()),
        failure: (e) => emit(LoginFailure(e.message)),
      );
    } else {
      form.markAllAsTouched();
    }
  }
}
