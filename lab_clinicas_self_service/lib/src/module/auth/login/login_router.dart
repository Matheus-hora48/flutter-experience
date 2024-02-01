import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/module/auth/login/login_controller.dart';
import 'package:lab_clinicas_self_service/src/module/auth/login/login_page.dart';
import 'package:lab_clinicas_self_service/src/services/user_login_service_impl.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginServiceImpl>(
            (i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController(loginService: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
