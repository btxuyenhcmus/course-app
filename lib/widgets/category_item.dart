import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.05),
            blurRadius: .5,
            spreadRadius: .5,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/categories/all.svg",
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "All",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
