import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/documents/documents_page.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/documents/scan/documents_scan_page.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/documents/scan_confirm/documents_scan_confirm_router.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/done/done_page.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/find_patient/find_patient_router.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/patient/patient_router.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/self_service_controller.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/self_service_page.dart';
import 'package:lab_clinicas_self_service/src/module/self_service/who_i_am/who_i_am_page.dart';
import 'package:lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:lab_clinicas_self_service/src/repositories/information_form/information_form_repository_impl.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patients_repository.dart';
import 'package:lab_clinicas_self_service/src/repositories/patients/patients_repository_impl.dart';

class SelfServiceModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InformationFormRepository>(
            (i) => InformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton(
            (i) => SelfServiceController(informationFormRepository: i())),
        Bind.lazySingleton<PatientsRepository>(
            (i) => PatientsRepositoryImpl(restClient: i()))
      ];

  @override
  String get moduleRouteName => '/self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SelfServicePage(),
        '/whoIAm': (context) => const WhoIAmPage(),
        '/findPatient': (context) => const FindPatientRouter(),
        '/patient': (context) => const PatientRouter(),
        '/documents': (context) => const DocumentsPage(),
        '/documents/scan': (context) => const DocumentsScanPage(),
        '/documents/scan/confirm': (context) =>
            const DocumentsScanConfirmRouter(),
        '/done': (context) => DonePage(),
      };
}
