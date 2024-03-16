import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';

import './patients_repository.dart';

class PatientsRepositoryImpl implements PatientsRepository {
  final RestClient restClient;

  PatientsRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, PatientsModel?>> findPatientByDocument(
      String document) async {
    try {
      final Response(:List data) =
          await restClient.auth.get('/patients', queryParameters: {
        'document': document,
      });

      if (data.isEmpty) {
        return Right(null);
      }

      return Right(PatientsModel.fromJson(data.first));
    } on DioException catch (e, s) {
      log('Erro ao buscar paciente por cpf', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, Unit>> update(
      PatientsModel patient) async {
    try {
      await restClient.auth.put(
        '/patients/${patient.id}',
        data: patient.toJson(),
      );
      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao atualizar o paciente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
