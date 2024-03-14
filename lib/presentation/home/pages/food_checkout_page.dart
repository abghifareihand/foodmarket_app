import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/payment/payment_page.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/formatter.dart';
import 'package:foodmarket_app/data/models/food_response_model.dart';
import 'package:foodmarket_app/data/models/request/checkout_request_model.dart';
import 'package:foodmarket_app/presentation/account/bloc/user/user_bloc.dart';
import 'package:foodmarket_app/presentation/dashboard/pages/dashboard_page.dart';
import 'package:foodmarket_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:foodmarket_app/presentation/home/widgets/item_order_widget.dart';
import 'package:foodmarket_app/presentation/home/widgets/user_order_widget.dart';

class FoodCheckoutPage extends StatelessWidget {
  final Food food;
  final int quantity;
  final int totalPrice;
  const FoodCheckoutPage({
    super.key,
    required this.food,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// Item Order
          ItemOrderWidget(
            food: food,
            quantity: quantity,
            totalPrice: totalPrice,
          ),

          const SpaceHeight(24),

          /// User Order
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const LoadingSpinkit();
                },
                loaded: (authResponse) {
                  return UserOrderWidget(
                    user: authResponse.data,
                  );
                },
              );
            },
          ),

          const SpaceHeight(32),
          BlocConsumer<CheckoutBloc, CheckoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (message) {},
                loaded: (checkoutResponse) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PaymentPage(
                            url: checkoutResponse.data.paymentUrl);
                      },
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              double driver = food.price * 0.4;
              double tax = totalPrice * 0.1;
              double totalSummary = totalPrice + driver + tax;
              return state.maybeWhen(
                orElse: () {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Button.primary(
                      onPressed: () {
                        final checkout = CheckoutRequestModel(
                          foodId: food.id,
                          quantity: quantity,
                          total: totalSummary.toInt(),
                        );

                        context
                            .read<CheckoutBloc>()
                            .add(CheckoutEvent.checkout(checkout));
                      },
                      label: 'Checkout Now',
                    ),
                  );
                },
                loading: () {
                  return const LoadingSpinkit();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
