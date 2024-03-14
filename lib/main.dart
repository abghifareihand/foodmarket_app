import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/presentation/account/bloc/logout/logout_bloc.dart';
import 'package:foodmarket_app/presentation/account/bloc/user/user_bloc.dart';
import 'package:foodmarket_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:foodmarket_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:foodmarket_app/presentation/auth/pages/login_page.dart';
import 'package:foodmarket_app/presentation/dashboard/pages/dashboard_page.dart';
import 'package:foodmarket_app/presentation/home/bloc/category/category_bloc.dart';
import 'package:foodmarket_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:foodmarket_app/presentation/home/bloc/food/food_bloc.dart';
import 'package:foodmarket_app/presentation/transaction/bloc/transaction/transaction_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => FoodBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            debugPrint("isLogin: ${snapshot.data}");
            if (snapshot.data != null && snapshot.data!) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
