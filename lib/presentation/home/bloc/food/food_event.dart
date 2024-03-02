part of 'food_bloc.dart';

@freezed
class FoodEvent with _$FoodEvent {
  const factory FoodEvent.started() = _Started;
  const factory FoodEvent.getFood() = _GetFood;
  const factory FoodEvent.getFoodType(String type) = _GetFoodType;
  const factory FoodEvent.searchFood(String name) = _SearchFood;
}