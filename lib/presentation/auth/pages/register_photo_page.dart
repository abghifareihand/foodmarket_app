import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/input_field.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/images.dart';
import 'package:foodmarket_app/presentation/auth/pages/register_address_page.dart';

class RegisterPhotoPage extends StatefulWidget {
  const RegisterPhotoPage({super.key});

  @override
  State<RegisterPhotoPage> createState() => _RegisterPhotoPageState();
}

class _RegisterPhotoPageState extends State<RegisterPhotoPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            /// header
            Container(
              margin: const EdgeInsets.only(
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: blackTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Register and eat',
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),

            /// upload photo
            GestureDetector(
              onTap: () async {},
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.border,
                ),
                child: Center(
                  child: Image.asset(
                    Images.iconUpload,
                    width: 32,
                  ),
                ),
              ),
            ),

            InputField.text(
              label: 'Full Name',
              controller: _nameController,
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
            Button.primary(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterAddressPage(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                );
              },
              label: 'Continue',
            ),
            const SpaceHeight(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: blackTextStyle.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
    );
  }
}
