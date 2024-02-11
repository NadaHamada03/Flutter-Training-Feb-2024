// Events
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginPageEvent {}

class LoginButtonPressed extends LoginPageEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

// States
abstract class LoginPageState {}

class LoginPageInitial extends LoginPageState {}

class LoginPageLoading extends LoginPageState {}

class LoginPageSuccess extends LoginPageState {}

class LoginPageFailure extends LoginPageState {
  final String error;

  LoginPageFailure({required this.error});
}

// Cubit
class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageInitial());

  void login(String email, String password) {
    emit(LoginPageLoading());

    // Add your login logic here
    // For simplicity, let's assume the login is successful
    emit(LoginPageSuccess());
  }
}