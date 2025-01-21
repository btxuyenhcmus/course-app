import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_application_1/utils/data.dart';
import 'package:flutter_application_1/widgets/category_item.dart';
import 'package:flutter_svg/svg.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: getSearchBox(),
          ),
          SliverToBoxAdapter(
            child: getCategories(),
          ),
          SliverList(
            delegate: getCourses(),
          ),
        ],
      ),
    );
  }

  int selectedCategoryIndex = 0;
  getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 5),
      child: Row(
        children: List.generate(
          categories.length,
          (index) => CategoryItem(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            data: categories[index],
            isActive: selectedCategoryIndex == index,
          ),
        ),
      ),
    );
  }

  getCourses() {
    return SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          width: 200,
          height: 290,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowColor.withOpacity(.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  imageUrl: courses[0]["image"],
                ),
              ),
              Positioned(
                top: 180,
                right: 15,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.shadowColor.withOpacity(.05),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(1, 1),
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/bookmark.svg",
                    color: AppColor.primary,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Positioned(
                top: 210,
                child: Column(
                  children: [
                    Text(
                      courses[0]["name"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Row getAppBar() {
    return Row(
      children: [
        Text(
          "Explore",
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        )
      ],
    );
  }

  getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowColor.withOpacity(.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              "assets/icons/filter.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
