import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/patient/patient_controller.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/patient/patient_page.dart';

class PatientRouter extends FlutterGetItModulePageRouter {
  const PatientRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => PatientController(repository: i())),
      ];

  @override
  WidgetBuilder get view => (_) => const PatientPage();
}
