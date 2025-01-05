import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

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
          child: SvgPicture.asset("assets/icons/categories/all.svg"),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Title"),
      ],
    );
  }
}
