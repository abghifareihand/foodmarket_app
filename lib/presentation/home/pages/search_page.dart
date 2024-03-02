import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/images.dart';
import 'package:foodmarket_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodmarket_app/presentation/home/widgets/card_food_widget.dart';
import 'package:foodmarket_app/presentation/home/widgets/shimmer_card_food.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    Images.iconBack,
                    height: 40,
                    width: 40,
                    color: AppColor.black,
                  ),
                ),
                const SpaceWidth(8),
                Expanded(
                  child: Container(
                    // margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColor.border,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      cursorColor: AppColor.primary,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: greyTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColor.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0,
                        ),
                      ),
                      onChanged: (text) {
                        context
                            .read<FoodBloc>()
                            .add(FoodEvent.searchFood(text));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: Text('Empty'),
                  );
                },
                loading: () {
                  return const ShimmerCardFood();
                },
                loaded: (foodResponse) {
                  final food = foodResponse.data.data;
                  if (food.isEmpty) {
                    return const Center(
                      child: Text('Empty'),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: food.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 2,
                        color: AppColor.grey.withOpacity(0.2),
                      );
                    },
                    itemBuilder: (context, index) {
                      return CardFoodWidget(
                        food: food[index],
                      );
                    },
                  );
                },
                error: (message) {
                  return Center(
                    child: Text('Error => $message'),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
