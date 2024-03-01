import 'package:flutter/material.dart';
import 'package:foodmarket_app/core/constants/colors.dart';
import 'package:foodmarket_app/core/constants/images.dart';
import 'package:foodmarket_app/presentation/home/pages/home_page.dart';
import 'package:foodmarket_app/presentation/order/pages/order_page.dart';
import 'package:foodmarket_app/presentation/account/pages/account_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const OrderPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      // body: _pages[_selectedIndex],
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconOrder)),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconAccount)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
