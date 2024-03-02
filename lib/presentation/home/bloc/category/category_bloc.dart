import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/data/datasources/food_remote_datasource.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const _Initial()) {
    on<_GetFoodCategory>((event, emit) async {
      emit(const _Loading());
      final result = await FoodRemoteDatasource().getFoodType(event.type);
      result.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Loaded(data)),
      );
    });
  }
}
