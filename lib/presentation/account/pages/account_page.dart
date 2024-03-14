import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodmarket_app/core/components/button.dart';
import 'package:foodmarket_app/core/components/loading_spinkit.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/images.dart';
import 'package:foodmarket_app/core/constants/variables.dart';
import 'package:foodmarket_app/data/datasources/auth_local_datasource.dart';
import 'package:foodmarket_app/presentation/account/bloc/logout/logout_bloc.dart';
import 'package:foodmarket_app/presentation/account/bloc/user/user_bloc.dart';
import 'package:foodmarket_app/presentation/account/pages/edit_account_page.dart';
import 'package:foodmarket_app/presentation/account/widgets/list_menu.dart';
import 'package:foodmarket_app/presentation/auth/pages/login_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(const UserEvent.getUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          /// User
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const LoadingSpinkit();
                  },
                  loading: () {
                    return const LoadingSpinkit();
                  },
                  loaded: (authResponse) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: authResponse.data.profilePhotoPath.isNotEmpty
                                ? Image.network(
                                    '${Variables.baseUrl}/storage/${authResponse.data.profilePhotoPath}',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    Images.placeholder,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Text(
                          authResponse.data.name.toUpperCase(),
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SpaceHeight(24),
                        ListMenu(
                          icon: Icons.person,
                          title: 'Edit Profile',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditAccountPage(
                                      userResponse: authResponse);
                                },
                              ),
                            );
                          },
                        ),
                        ListMenu(
                          icon: Icons.book,
                          title: 'Riwayat Transaksi',
                          onTap: () {},
                        ),
                        ListMenu(
                          icon: Icons.info,
                          title: 'Pusat Bantuan',
                          onTap: () {},
                        ),
                        ListMenu(
                          icon: Icons.settings,
                          title: 'Settings',
                          onTap: () {},
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          /// Logout
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (message) {},
                loaded: (message) async {
                  await AuthLocalDatasource().removeAuthData();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  }
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.primary(
                    onPressed: () {
                      context
                          .read<LogoutBloc>()
                          .add(const LogoutEvent.logout());
                    },
                    label: 'Logout',
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
