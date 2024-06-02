// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_adm/src/repositories/painel/painel_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PainelRepositoryImpl implements PainelRepository {
  PainelRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, String>> callOnPanel(
    String password,
    int attendantDesk,
  ) async {
    try {
      final Response(data: {'id': id}) =
          await restClient.auth.post('/painelChenckin', data: {
        'password': password,
        'time_called': DateTime.now().toIso8601String(),
        'attendant_desk': attendantDesk,
      });

      return Right(id);
    } on DioException catch (e, s) {
      log('Erro ao chamar paciente no painel', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
