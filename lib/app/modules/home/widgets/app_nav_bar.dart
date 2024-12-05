import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resource/app_colors.dart';
import '../../../../resources/resources.dart';
import '../../../../values/app_strings.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({required this.currentIndex, this.onTap, super.key});

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final items = _items();
    return Platform.isIOS
        ? CupertinoTabBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
            activeColor: AppColors.text,
            inactiveColor: AppColors.primary,
          )
        : BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
          );
  }

  static List<BottomNavigationBarItem> _items() {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Vectors.user,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Vectors.userFill,
          colorFilter: const ColorFilter.mode(
            AppColors.text,
            BlendMode.srcIn,
          ),
        ),
        label: AppStrings.users,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Vectors.wallet,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Vectors.walletFill,
          colorFilter: const ColorFilter.mode(
            AppColors.text,
            BlendMode.srcIn,
          ),
        ),
        label: AppStrings.wallet,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          Vectors.doc,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          Vectors.docFill,
          colorFilter: const ColorFilter.mode(
            AppColors.text,
            BlendMode.srcIn,
          ),
        ),
        label: AppStrings.history,
      ),
    ];
  }
}
