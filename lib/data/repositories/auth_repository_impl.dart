import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/entities/RegisterResponseEntities.dart';
import 'package:movie_app/domain/repositories/auth/auth_repository.dart';
import 'package:movie_app/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';

@Injectable(as:AuthRepository )
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId) async {
    var either = await authRemoteDataSource.register(
        name, email, password, confirmPassword, phone, avaterId);
    return either.fold((error) => left(error), (response) => right(response));
  }
}
