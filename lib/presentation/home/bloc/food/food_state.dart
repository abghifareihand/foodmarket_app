part of 'food_bloc.dart';

@freezed
class FoodState with _$FoodState {
  const factory FoodState.initial() = _Initial;
  const factory FoodState.loading() = _Loading;
  const factory FoodState.loaded(FoodResponseModel foodResponse) = _Loaded;
  const factory FoodState.error(String message) = _Error;
}
