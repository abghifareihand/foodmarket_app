import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/input_field.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/data/models/request/register_request_model.dart';
import 'package:foodmarket_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:foodmarket_app/presentation/dashboard/pages/dashboard_page.dart';

class RegisterAddressPage extends StatefulWidget {
  final String name;
  final String email;
  final String password;
  const RegisterAddressPage({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  State<RegisterAddressPage> createState() => _RegisterAddressPageState();
}

class _RegisterAddressPageState extends State<RegisterAddressPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            InputField.number(
              label: 'Phone',
              controller: _phoneController,
            ),
            InputField.text(
              label: 'Address',
              controller: _addressController,
            ),
            InputField.text(
              label: 'House No.',
              controller: _houseController,
            ),
            InputField.text(
              label: 'City',
              controller: _cityController,
            ),
            const SpaceHeight(20.0),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) {},
                  loaded: (authResponse) async {
                    await AuthLocalDatasource().saveAuthData(authResponse);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardPage(),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Button.primary(
                      onPressed: () {
                        final registerRequest = RegisterRequestModel(
                          name: widget.name,
                          email: widget.email,
                          password: widget.password,
                          passwordConfirmation: widget.password,
                          address: _addressController.text,
                          city: _cityController.text,
                          houseNumber: _houseController.text,
                          phoneNumber: _phoneController.text,
                        );
                        context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.register(registerRequest));
                      },
                      label: 'Register',
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
      ),
    );
  }
}
