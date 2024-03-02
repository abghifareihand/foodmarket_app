import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/data/datasources/food_remote_datasource.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_event.dart';
part 'food_state.dart';
part 'food_bloc.freezed.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(const _Initial()) {
    on<_GetFood>((event, emit) async {
      emit(const _Loading());
      final result = await FoodRemoteDatasource().getFood();
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });

    on<_GetFoodType>((event, emit) async {
      emit(const _Loading());
      final result = await FoodRemoteDatasource().getFoodType(event.type);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });

    on<_SearchFood>((event, emit) async {
      emit(const _Loading());
      final result = await FoodRemoteDatasource().searchFood(event.name);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
