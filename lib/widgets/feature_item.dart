import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/color.dart';
import 'package:flutter_application_1/utils/data.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
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
              imageUrl: data["image"],
            ),
          ),
          Positioned(
            top: 180,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                data["price"],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 210,
            child: SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getAttribute(
                        data["session"],
                        Icons.play_circle_outline,
                        AppColor.labelColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      getAttribute(
                        data["duration"],
                        Icons.schedule_outlined,
                        AppColor.labelColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      getAttribute(
                        data["review"],
                        Icons.star,
                        AppColor.yellow,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getAttribute(String info, IconData icon, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(width: 3),
        Text(
          info,
          style: TextStyle(
            color: AppColor.labelColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
