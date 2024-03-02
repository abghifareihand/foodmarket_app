import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/input_field.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/data/models/request/user_request_model.dart';

import 'package:foodmarket_app/data/models/user_response_model.dart';
import 'package:foodmarket_app/presentation/account/bloc/user/user_bloc.dart';

class EditAccountPage extends StatefulWidget {
  final UserResponseModel userResponse;
  const EditAccountPage({
    super.key,
    required this.userResponse,
  });

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userResponse.data.name;
    _emailController.text = widget.userResponse.data.email;
    _addressController.text = widget.userResponse.data.address;
    _cityController.text = widget.userResponse.data.city;
    _houseController.text = widget.userResponse.data.houseNumber;
    _phoneController.text = widget.userResponse.data.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primary,
        title: const Text('Edit Account'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          InputField.text(
            label: 'Name',
            controller: _nameController,
          ),
          InputField.email(
            label: 'Email',
            controller: _emailController,
          ),
          InputField.email(
            label: 'Address',
            controller: _addressController,
          ),
          InputField.email(
            label: 'City',
            controller: _cityController,
          ),
          InputField.email(
            label: 'House Number',
            controller: _houseController,
          ),
          InputField.email(
            label: 'Phone Number',
            controller: _phoneController,
          ),
          const SpaceHeight(20.0),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: (authResponse) {
                  Navigator.pop(context);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.primary(
                    onPressed: () {
                      final userRequest = UserRequestModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        address: _addressController.text,
                        city: _cityController.text,
                        houseNumber: _houseController.text,
                        phoneNumber: _phoneController.text,
                      );
                      context
                          .read<UserBloc>()
                          .add(UserEvent.updateUser(userRequest));
                    },
                    label: 'Update Data',
                  );
                },
                loading: () {
                  return const LoadingSpinkit();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
