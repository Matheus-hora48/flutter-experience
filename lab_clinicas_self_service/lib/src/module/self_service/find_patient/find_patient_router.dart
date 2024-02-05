import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/find_patient/find_patient_page.dart';

class FindPatientRouter extends FlutterGetItModulePageRouter {
  const FindPatientRouter({super.key});

  @override
  WidgetBuilder get view => throw const FindPatientPage();
}
