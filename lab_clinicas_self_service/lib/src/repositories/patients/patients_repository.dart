import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';

abstract interface class PatientsRepository {
  Future<Either<RepositoryException, PatientsModel?>> findPatientByDocument(String document);
}