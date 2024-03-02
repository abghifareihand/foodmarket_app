import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/presentation/home/bloc/category/category_bloc.dart';
import 'package:foodmarket_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodmarket_app/presentation/home/widgets/card_food_shimmer.dart';
import 'package:foodmarket_app/presentation/home/widgets/card_food_widget.dart';
import 'package:foodmarket_app/presentation/home/widgets/tile_food_shimmer.dart';
import 'package:foodmarket_app/presentation/home/widgets/tile_food_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> foodTypes = [
    'Recommended',
    'Popular',
    'Bestseller',
  ];
  String selectedFoodType = 'Recommended';

  @override
  void initState() {
    context.read<FoodBloc>().add(const FoodEvent.getFood());
    context
        .read<CategoryBloc>()
        .add(CategoryEvent.getFoodCategory(selectedFoodType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.primary,
        onRefresh: () async {
          context.read<FoodBloc>().add(const FoodEvent.getFood());
        },
        child: ListView(
          children: [
            /// Search
            Container(
              margin: const EdgeInsets.all(20),
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
                onChanged: (value) {
                  context.read<FoodBloc>().add(FoodEvent.searchFood(value));
                },
              ),
            ),

            SizedBox(
              height: 250,
              child: BlocBuilder<FoodBloc, FoodState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const CardFoodShimmer();
                    },
                    loading: () {
                      return const CardFoodShimmer();
                    },
                    loaded: (foodResponse) {
                      final food = foodResponse.data.data;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: food.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        separatorBuilder: (context, index) =>
                            const SpaceWidth(16),
                        itemBuilder: (context, index) {
                          return CardFoodWidget(food: food[index]);
                        },
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 36,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: foodTypes.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemBuilder: (context, index) {
                  final type = foodTypes[index];
                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        selectedFoodType = type;
                      });
                      context
                          .read<CategoryBloc>()
                          .add(CategoryEvent.getFoodCategory(selectedFoodType));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: type == selectedFoodType
                            ? AppColor.primary
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          type,
                          style: type == selectedFoodType
                              ? whiteTextStyle.copyWith(fontWeight: medium)
                              : greyTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Food list
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const TileFoodShimmer();
                  },
                  loading: () {
                    return const TileFoodShimmer();
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
                        return TileFoodWidget(
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
      ),
    );
  }
}
