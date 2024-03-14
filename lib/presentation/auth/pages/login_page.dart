import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/input_field.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/images.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/data/models/request/login_request_model.dart';
import 'package:foodmarket_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:foodmarket_app/presentation/auth/pages/register_photo_page.dart';
import 'package:foodmarket_app/presentation/dashboard/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 330,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Images.food,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        /// header
                        Container(
                          margin: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: blackTextStyle.copyWith(
                                  fontSize: 22,
                                  fontWeight: medium,
                                ),
                              ),
                              Text(
                                'Login and eat',
                                style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: light,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InputField.email(
                          label: 'Email',
                          controller: _emailController,
                        ),
                        InputField.password(
                          label: 'Password',
                          controller: _passwordController,
                        ),
                        const SpaceHeight(20.0),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              error: (message) {},
                              loaded: (authResponse) async {
                                await AuthLocalDatasource()
                                    .saveAuthData(authResponse);
                                if (context.mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardPage(),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Button.primary(
                                  onPressed: () {
                                    final loginRequest = LoginRequestModel(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                                    context
                                        .read<LoginBloc>()
                                        .add(LoginEvent.login(loginRequest));
                                  },
                                  label: 'Login',
                                );
                              },
                              loading: () {
                                return const LoadingSpinkit();
                              },
                            );
                          },
                        ),
                        const SpaceHeight(20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont have an account? ',
                              style: blackTextStyle.copyWith(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPhotoPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
