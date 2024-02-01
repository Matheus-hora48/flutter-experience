import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/module/auth/login/login_router.dart';
import 'package:lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';

class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton(
          (i) => UserRepositoryImpl(restClient: i()),
        ),
      ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/login': (_) => const LoginRouter(),
  };
}
