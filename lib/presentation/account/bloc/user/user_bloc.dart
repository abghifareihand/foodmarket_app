import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/data/datasources/auth_remote_datasource.dart';
import 'package:foodmarket_app/data/models/request/user_request_model.dart';
import 'package:foodmarket_app/data/models/user_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const _Initial()) {
    on<_GetUser>((event, emit) async {
     emit(const _Loading());
      final result = await AuthRemoteDatasource().getUser();
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });

    on<_UpdateUser>((event, emit) async {
     emit(const _Loading());
      final result = await AuthRemoteDatasource().updateUser(event.userRequest);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
