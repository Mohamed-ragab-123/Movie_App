import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/entities/RegisterResponseEntities.dart';

abstract class RegisterStates {}
class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  Failures errors;
  RegisterErrorState({required this.errors});
}
class RegisterSuccessState extends RegisterStates{
  RegisterResponseEntity responseEntity;
  RegisterSuccessState({required this.responseEntity});
}