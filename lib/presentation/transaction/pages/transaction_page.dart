import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/formatter.dart';
import 'package:foodmarket_app/presentation/transaction/bloc/transaction/transaction_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context
        .read<TransactionBloc>()
        .add(const TransactionEvent.getTransaction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<TransactionBloc>()
              .add(const TransactionEvent.getTransaction());
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const LoadingSpinkit();
                  },
                  loading: () {
                    return const LoadingSpinkit();
                  },
                  loaded: (transactionResponse) {
                    final transaction = transactionResponse.data.data;
                    if (transactionResponse.data.data.isEmpty) {
                      return const Center(
                        child: Text('Tidak ada transaksi'),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transactionResponse.data.data.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 2,
                          color: AppColor.grey.withOpacity(0.2),
                        );
                      },
                      itemBuilder: (context, index) {
                        final data = transaction[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  height: 80,
                                  width: 80,
                                  data.food.picturePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SpaceWidth(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.food.name} (${data.quantity} items)',
                                      style: blackTextStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      data.status,
                                      style: data.status == 'SUCCESS'
                                          ? greenTextStyle.copyWith(
                                              fontWeight: medium)
                                          : redTextStyle.copyWith(
                                              fontWeight: medium),
                                    ),
                                    Text(
                                      data.createdAt,
                                      style: greyTextStyle.copyWith(
                                        fontWeight: light,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                priceFormat(data.total),
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        );
                        // return ListTile(
                        //   leading: ClipRRect(
                        //     borderRadius: BorderRadius.circular(16),
                        //     child: Image.network(
                        //       height: 80,
                        //       width: 80,
                        //       data.food.picturePath,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        //   title: Text(
                        //     '${data.food.name} (${data.quantity} items)',
                        //     style: blackTextStyle.copyWith(
                        //       fontWeight: medium,
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        //   subtitle: Text(
                        //     data.status,
                        //     style: data.status == 'SUCCESS'
                        //         ? greenTextStyle.copyWith(fontWeight: medium)
                        //         : redTextStyle.copyWith(fontWeight: medium),
                        //   ),
                        //   trailing: Text(
                        //     priceFormat(data.total),
                        //     style: blackTextStyle.copyWith(),
                        //   ),
                        // );
                      },
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
