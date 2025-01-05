import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_application_1/widgets/buttombar_item.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: activePageIndex,
      children: List.generate(
        tabItems.length,
        (index) => tabItems[index]["page"],
      ),
    );
  }

  List tabItems = [
    {
      "icon": "assets/icons/home.svg",
      "page": HomePage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "page": Container(
        child: Center(
          child: Text("Search"),
        ),
      ),
    },
    {
      "icon": "assets/icons/play.svg",
      "page": Container(
        child: Center(
          child: Text("My Course"),
        ),
      ),
    },
    {
      "icon": "assets/icons/chat.svg",
      "page": Container(
        child: Center(
          child: Text("Chat"),
        ),
      ),
    },
    {
      "icon": "assets/icons/profile.svg",
      "page": Container(
        child: Center(
          child: Text("Profile"),
        ),
      ),
    },
  ];

  int activePageIndex = 0;
  Widget buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarItem(
            icon: "assets/icons/home.svg",
            isActive: true,
            onTap: () {
              onPageIndexChanged(0);
            },
          ),
          BottomBarItem(
            icon: "assets/icons/search.svg",
            onTap: () {
              onPageIndexChanged(1);
            },
          ),
          BottomBarItem(
            icon: "assets/icons/play.svg",
            onTap: () {
              onPageIndexChanged(2);
            },
          ),
          BottomBarItem(
            icon: "assets/icons/chat.svg",
            onTap: () {
              onPageIndexChanged(3);
            },
          ),
          BottomBarItem(
            icon: "assets/icons/profile.svg",
            onTap: () {
              onPageIndexChanged(4);
            },
          ),
        ],
      ),
    );
  }

  onPageIndexChanged(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}
