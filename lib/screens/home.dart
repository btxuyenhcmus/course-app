import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_application_1/widgets/category_box.dart';
import 'package:flutter_application_1/widgets/notification_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sangvaleap",
                  style: TextStyle(
                    color: AppColor.labelColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Good Morning!",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            NotificationBox(
              notifiedNumber: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getCategories(),
        ],
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(),
          ),
        ),
      ),
    );
  }
}
