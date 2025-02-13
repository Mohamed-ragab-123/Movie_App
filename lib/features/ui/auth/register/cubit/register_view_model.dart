import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/use_cases/register_use_case.dart';
import 'package:movie_app/features/ui/auth/register/cubit/register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel(this.selectedAvatarIndex,  {required this.registerUseCase})
      : super(RegisterInitialState());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  final int selectedAvatarIndex;

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneNumberController.text,
        selectedAvatarIndex);
    either.fold((error) {
      emit(RegisterErrorState(errors: error));
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
