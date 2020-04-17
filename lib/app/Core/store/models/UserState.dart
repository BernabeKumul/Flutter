import 'package:flutter/cupertino.dart';

class UserState{
  final bool isLoading;
  final bool loadingError;
  final UserResponse user;

  UserState({
    @required this.isLoading,
    @required this.loadingError,
    @required this.user});

  factory UserState.initial(){
    return new UserState(isLoading: false, loadingError: false, user: null);
  }

  UserState copyWith({bool isLoading, bool loadingError, UserResponse user}){
    return new UserState(
      isLoading: isLoading ?? this.isLoading,
      loadingError: loadingError ?? this.loadingError,
      user: user ?? this.user);
  }

  @override
  int get hasCode => isLoading.hashCode ^ user.hashCode;
}


class UserResponse{
    final String name;
    final String lastName;

    UserResponse({
      this.name, this.lastName
    });
}