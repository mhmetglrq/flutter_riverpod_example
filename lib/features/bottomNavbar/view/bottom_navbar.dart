import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/config/extension/context_extension.dart';
import 'package:flutter_riverpod_example/config/utility/enum/image_constants.dart';
import 'package:flutter_riverpod_example/features/dashboard/view/dashboard.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/items/app_colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _widgetOptions = [
    const Dashboard(),
    const Dashboard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(
          side: BorderSide(
            color: AppColors.primary,
          ),
        ),
        child: SvgPicture.asset(
          ImageConstants.ticket.getSvg,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          height: context.dynamicHeight(0.07),
          shadowColor: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          surfaceTintColor: AppColors.secondary,
          color: AppColors.secondary,
          notchMargin: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _onItemTapped(1);
                },
                child: SvgPicture.asset(
                  ImageConstants.home.getSvg,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _onItemTapped(1);
                },
                child: SvgPicture.asset(
                  ImageConstants.profile.getSvg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
