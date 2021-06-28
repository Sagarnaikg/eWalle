import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimeDateWeatherWidget extends StatelessWidget {
  const TimeDateWeatherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "06:20 PM",
                style: TextStyle(
                  color: AppColor.COLOR_1B1D28,
                  fontSize: 28,
                  fontWeight: AppFontWeight.regular,
                  height: 1.1,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppMedia.getIcon("weather.svg"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "34° C",
                    style: TextStyle(
                      color: AppColor.COLOR_1B1D28,
                      fontSize: 14,
                      fontWeight: AppFontWeight.semiBold,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 1,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColor.COLOR_7B7F9E,
                fontSize: 14,
                fontWeight: AppFontWeight.regular,
              ),
              children: [
                TextSpan(text: "Nov.10.2020"),
                TextSpan(text: "   |   "),
                TextSpan(text: "Wednesday"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
