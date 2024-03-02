import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodmarket_app/presentation/home/widgets/card_food_widget.dart';
import 'package:foodmarket_app/presentation/home/widgets/shimmer_card_food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  List<String> foodTypes = [
    'All Food',
    'Recommended',
    'Popular',
    'Bestseller',
  ];
  String selectedFoodType = 'All Food';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    if (selectedFoodType == 'All Food') {
      context.read<FoodBloc>().add(const FoodEvent.getFood());
    } else {
      context.read<FoodBloc>().add(FoodEvent.getFoodType(selectedFoodType));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
              controller: searchController,
              onChanged: (text) {
                context.read<FoodBloc>().add(FoodEvent.searchFood(text));
              },
            ),
          ),

          // Food type list
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
                    fetchData();
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
          BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const ShimmerCardFood();
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
