import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SvgPicture.asset(
            data["icon"],
            width: 30,
            height: 30,
            color: AppColor.textColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data["name"],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
