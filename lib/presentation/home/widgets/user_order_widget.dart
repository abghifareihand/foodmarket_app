import 'package:flutter/material.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/data/models/user_response_model.dart';

class UserOrderWidget extends StatelessWidget {
  final User user;
  const UserOrderWidget({
    super.key,
    required this.user,
  });

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
            'Deliver to :',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SpaceHeight(8),

          /// Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                user.name,
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phone',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                user.phoneNumber,
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// Address
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                user.address,
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// House No.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'House No.',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                user.houseNumber,
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),

          /// City
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'City',
                style: greyTextStyle.copyWith(),
              ),
              Text(
                user.city,
                style: blackTextStyle.copyWith(),
              ),
            ],
          ),
          const SpaceHeight(4),
        ],
      ),
    );
  }
}
