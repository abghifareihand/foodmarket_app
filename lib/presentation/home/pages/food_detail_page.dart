import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/formatter.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';
import 'package:foodmarket_app/presentation/home/pages/food_checkout_page.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.food.picturePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 280),
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColor.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SpaceHeight(8),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: widget.food.rate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // Lakukan sesuatu ketika rating diperbarui
                              },
                            ),
                            const SpaceWidth(8),
                            Text(
                              widget.food.rate.toString(),
                              style: greyTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColor.black,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                          child: Text(
                            quantity.toString(),
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity < 10) {
                                quantity++;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColor.black,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SpaceHeight(20),
                Text(
                  widget.food.description,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SpaceHeight(20),
                Text(
                  'Ingredients : ',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.food.ingredients,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColor.white,
        height: 65,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price :',
                    style: blackTextStyle.copyWith(),
                  ),
                  Text(
                    priceFormat(widget.food.price * quantity),
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Button.primary(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FoodCheckoutPage(
                        food: widget.food,
                        quantity: quantity,
                        totalPrice: widget.food.price * quantity,
                      );
                    },
                  ));
                },
                label: 'Order Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
