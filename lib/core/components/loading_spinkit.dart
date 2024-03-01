import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodmarket_app/core/constants/colors.dart';

class LoadingSpinkit extends StatelessWidget {
  const LoadingSpinkit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCircle(
        color: AppColor.primary,
      ),
    );
  }
}
