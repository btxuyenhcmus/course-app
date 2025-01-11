import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_application_1/utils/data.dart';
import 'package:flutter_application_1/widgets/category_box.dart';
import 'package:flutter_application_1/widgets/feature_item.dart';
import 'package:flutter_application_1/widgets/notification_box.dart';
import 'package:flutter_application_1/widgets/recommend_item.dart';

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
      title: Row(
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
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategories(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Text(
              "Featured",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          getFeatures(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: AppColor.labelColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          getRecommends(),
        ],
      ),
    );
  }

  Widget getRecommends() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendItem(
              data: recommends[index],
              onTab: () {
                print(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getFeatures() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(data: features[index]),
      ),
    );
  }

  Widget getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              data: categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
