import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/entities/RegisterResponseEntities.dart';
import 'package:movie_app/domain/repositories/auth/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email,
      String password,
      String confirmPassword,
      String phone,
      int avaterId,) {
    return authRepository.register(
        name, email, password, confirmPassword, phone, avaterId);
  }
}