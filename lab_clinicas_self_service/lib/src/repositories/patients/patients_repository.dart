import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/model/patients_model.dart';

typedef RegisterPatientAddressModel = ({
  String cep,
  String streetAddress,
  String number,
  String addressComplement,
  String state,
  String city,
  String district,
});

typedef RegisterPatientModel = ({
  String name,
  String email,
  String document,
  String phoneNumber,
  RegisterPatientAddressModel address,
  String guardian,
  String guardianIdentificationNumber,
});

abstract interface class PatientsRepository {
  Future<Either<RepositoryException, PatientsModel?>> findPatientByDocument(String document);
  Future<Either<RepositoryException, Unit>> update(PatientsModel patient);
  Future<Either<RepositoryException, PatientsModel>> register(RegisterPatientModel patient);
}