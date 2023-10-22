import 'package:dio_bloc/data/datasource/remote_datasource.dart';
import 'package:dio_bloc/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDataSource remoteDataSource;
  UserBloc(
    this.remoteDataSource,
  ) : super(UserInitial()) {
    on<loadUser>((event, emit)  async {
      emit(
        UserLoading(),
      );
      try {
        final result = await remoteDataSource.getUsers();
        emit(
          UserLoaded(
            result.data
          )
        );
      } catch (error) {
        emit(
          UserError(error: error.toString()),
        );
      }
    });
  }
}
