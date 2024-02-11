// Events
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignUpPageEvent {}

class SignUpButtonPressed extends SignUpPageEvent {
  final String username;
  final String email;
  final String password;

  SignUpButtonPressed({required this.username, required this.email, required this.password});
}

// States
abstract class SignUpPageState {}

class SignUpPageInitial extends SignUpPageState {}

class SignUpPageLoading extends SignUpPageState {}

class SignUpPageSuccess extends SignUpPageState {}

class SignUpPageFailure extends SignUpPageState {
  final String error;

  SignUpPageFailure({required this.error});
}

// Cubit
class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit() : super(SignUpPageInitial());

  void signUp(String username, String email, String password) {
    emit(SignUpPageLoading());

    // Add your sign-up logic here
    // For simplicity, let's assume the sign-up is successful
    emit(SignUpPageSuccess());
  }
}