import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({super.key, this.notifiedNumber = 0});
  final int notifiedNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.appBarColor,
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: notifiedNumber > 0
          ? badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColor.primary,
                padding: EdgeInsets.all(3),
              ),
              position: badges.BadgePosition.topEnd(top: -7, end: 0),
              badgeContent: Text(''),
              child: SvgPicture.asset(
                "assets/icons/bell.svg",
                width: 20,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              "assets/icons/bell.svg",
              width: 20,
              height: 20,
            ),
    );
  }
}
