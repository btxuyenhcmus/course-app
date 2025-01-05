import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({
    super.key,
    required this.icon,
    this.activeColor = AppColor.primary,
    this.color = Colors.grey,
    this.isActive = false,
    this.onTap,
  });
  final String icon;
  final Color activeColor;
  final Color color;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColor.bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? activeColor : color,
        ),
      ),
    );
  }
}
