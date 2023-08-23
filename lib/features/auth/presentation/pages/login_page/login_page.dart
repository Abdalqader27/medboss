import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:core/core.dart';
import 'package:core/core.dart';
import 'package:core/core.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:design/design.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:medboss/common/widgets/app_loading.dart';
import 'package:medboss/features/auth/presentation/pages/login_page/widgets/custom_input_field.dart';
import 'package:medboss/features/auth/presentation/pages/login_page/widgets/page_header.dart';
import 'package:medboss/features/auth/presentation/pages/login_page/widgets/page_heading.dart';
import 'package:medboss/resources/resources.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/custom_painter/bottom_curve_painter.dart';
import '../../../../../common/utils/utils.dart';
import '../../../../../common/widgets/custom_text_field.dart';
import '../../../../../core/ads/widgets/banner.dart';
import '../../../../../core/injections/service_locator.dart';
import '../../../../../core/services/app_services.dart';
import '../../../../../core/services/auth_service.dart';
import '../sign_up/sign_up.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const path = '/$subPath';
  static const subPath = 'login-page';
  static const name = 'login_page';

  static const ValueKey pageKey = ValueKey(name);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: BlocProvider(
        create: (context) => LoginBloc(sl()),
        child: const LoginPage(),
      ),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final loginBloc = context.read<LoginBloc>();

    return AppBanner(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'التسجيل الدخول',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              icon: const Icon(
                Icons.dark_mode_outlined,
              ),
            ),
          ],
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: _listener,
          child: ReactiveForm(
            formGroup: loginBloc.form,
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsetsConstrains.listView,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      KeyboardVisibilityBuilder(
                        closed: () => Space.vxl,
                        open: () => Space.vxs,
                      ),
                      Hero(
                        tag: JsonRes.secureLogin,
                        child: Lottie.asset(
                          JsonRes.secureLogin,
                          height: 300,
                          width: 200,
                        ),
                      ),
                      KeyboardVisibilityBuilder(
                        closed: () => Space.vxl,
                        open: () => Space.vxs,
                      ),
                      Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: EdgeInsetsConstrains.textFiled,
                              child: ReactiveIntlPhoneFormField(
                                formControlName:
                                    LoginBloc.phoneNumberControllerName,
                                validationMessages: _phoneValidationMessage(),
                                hintText: 'رقم الهاتف',
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsConstrains.textFiled,
                            child: CustomReactiveTextField(
                              validationMessages: {
                                ValidationMessage.required: (_) =>
                                    'هذا الحقل مطلوب',
                              },
                              hintText: 'كلمة المرور',
                              prefix: IconlyBroken.password,
                              formControlName: LoginBloc.passwordControllerName,
                            ),
                          ),
                        ],
                      ),
                      KeyboardVisibilityBuilder(
                        closed: () => Space.vl,
                        open: () => Space.vxs,
                      ),
                      Padding(
                        padding: EdgeInsetsConstrains.textFiled,
                        child: FilledButton(
                          onPressed: () {
                            _onLoginPressed(context);
                          },
                          child: const Text(
                            'تسجيل الدخول',
                          ),
                        ),
                      ),
                      Space.vm,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const YouText.labelLarge(
                            'ليس لديك حساب ؟',
                          ),
                          TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              context.push(SignUpScreen.path);
                            },
                            child: const Text('انشاء حساب'),
                          ),
                        ].addSpacing(Space.hs),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    context.read<LoginBloc>().add(LoginSubmitted());
  }

  void _listener(BuildContext context, LoginState state) {
    if (state is LoginFailure) {
      final message = state.message;
      EasyLoading.dismiss();
      _showErrorDialog(context, message);
    } else if (state is LoginLoading) {
      showLoadingOverLay(message: 'جاري تسجيل الدخول ...');
    } else if (state is LoginSuccess) {
      EasyLoading.dismiss();
    }
  }

  _phoneValidationMessage() {
    return {
      ValidationMessage.required: (_) => '',
      'invalidNumber': (_) => '',
    };
  }

  _errorText(String message) {
    if (message == 'Successful request, but no results found') {
      return 'حسابك غير موجود ، يرجى التأكد من بياناتك';
    }
    return null;
  }

  _showErrorDialog(BuildContext context, String message) async {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.error,
      title: 'حدث خطأ ما',
      text: _errorText(message) ??
          'يرجى التأكد من البيانات المدخلة والمحاولة مرة أخرى',
      confirmBtnText: 'حسنا',
    );
  }
}
