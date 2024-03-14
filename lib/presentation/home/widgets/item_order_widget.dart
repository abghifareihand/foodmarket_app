import 'package:flutter/material.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/formatter.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({
    super.key,
    required this.food,
    required this.quantity,
    required this.totalPrice,
  });

  final Food food;
  final int quantity;
  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item Order',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SpaceHeight(8),
          Row(
            children: [
              /// Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  height: 80,
                  width: 80,
                  food.picturePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SpaceWidth(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SpaceHeight(4),
                    Text(
                      priceFormat(food.price),
                      style: blackTextStyle.copyWith(
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$quantity items',
                style: greyTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(16),
          Text(
            'Detail Transaction',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SpaceHeight(8),

          /// Total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                food.name,
                style: greyTextStyle.copyWith(),
              ),
              Text(
                priceFormat(totalPrice),
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// Shipping
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Driver',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                priceFormat(food.price * 0.4),
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// Tax
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax 10%',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                priceFormat(totalPrice * 0.1),
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// Total summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                priceFormat(totalPrice + food.price * 0.4 + totalPrice * 0.1),
                style: greenTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
