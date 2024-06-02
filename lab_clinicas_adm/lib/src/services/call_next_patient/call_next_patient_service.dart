// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:lab_clinicas_adm/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/painel/painel_repository.dart';
import 'package:lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class CallNextPatientService {
  CallNextPatientService({
    required this.patientInformationFormRepository,
    required this.attendantDeskAssignmentRepository,
    required this.painelRepository,
  });

  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendantDeskAssignmentRepository attendantDeskAssignmentRepository;
  final PainelRepository painelRepository;

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      execute() async {
    final result = await patientInformationFormRepository.callNextToCheckin();

    switch (result) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel>> updatePanel(
    PatientInformationFormModel form,
  ) async {
    final resultDesk =
        await attendantDeskAssignmentRepository.getDeskAssignment();

    switch (resultDesk) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final painelResult = await painelRepository.callOnPanel(
          form.password,
          deskNumber,
        );

        switch (painelResult) {
          case Left(value: final exception):
            log(
              'ATENÇÂO!!!! Não foi possivel chamar o paciente',
              error: exception,
              stackTrace: StackTrace.fromString(
                  'ATENÇÂO!!!! Não foi possivel chamar o paciente'),
            );
            return Right(form);
          case Right():
            return Right(form);
        }
    }
  }
}
