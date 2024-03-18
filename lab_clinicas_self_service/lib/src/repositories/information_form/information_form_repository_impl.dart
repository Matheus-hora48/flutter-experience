import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';
import 'package:lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  InformationFormRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, Unit>> register(
    SelfServiceModel model,
  ) async {
    try {
      final SelfServiceModel(
        :name!,
        :lastName!,
        patient: PatientsModel(id: patientId)!,
        documents: {
          DocumentType.healthInsuranceCard: List(first: healthInsuranceCardDoc),
          DocumentType.mediacalOrder: List(first: mediacalOrderDocs),
        }!
      ) = model;

      await restClient.auth.post('/patientInformationForm', data: {
        'patient_id': patientId,
        'health_insurance_card': healthInsuranceCardDoc,
        'medical_order': mediacalOrderDocs,
        'password': '$name $lastName',
        'date_created': DateTime.now().toIso8601String(),
        'status': 'Waiting',
        'tests': [],
      });

      return Right(unit);
    } on DioException catch (e, s) {
      log(
        'Erro ao finalizar formulário de auto atendimento',
        error: e,
        stackTrace: s,
      );
      return Left(RepositoryException());
    }
  }
}
