import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:lab_clinicas_adm/src/pages/home/home_page.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';

class HomeRouter extends FlutterGetItPageRouter {
  const HomeRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
          (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton((i) => HomeController(attendantDeskRepository: i()))
      ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => const HomePage();
}
