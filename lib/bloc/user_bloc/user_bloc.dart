import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_application_ceiba/models/user_model.dart';
import 'package:flutter_application_ceiba/repositories/post_db_repository.dart';
import 'package:flutter_application_ceiba/repositories/user_api_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserAPIRepository _userAPIRepository;
  final UserDBRepository _userDBRepository;


  UserBloc(this._userDBRepository, this._userAPIRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async{
      List<UserModel> users;
      List<UserModel> usersAPI;

      emit(UserLoadingState());
      
      try {
        users = await _userDBRepository.readLocalUsers();
        
        if(users.isEmpty){
          emit(UserSyncDataState());

          usersAPI = await _userAPIRepository.getUsers();

          for (var user in usersAPI) {
            await _userDBRepository.insertUsers(user);
          }

          users = await _userDBRepository.readLocalUsers();
        }

        emit(UserLoadedState(users));

      } catch (e) {
        emit(UserErrorState(e.toString() ));
      }

    });
  }
}
