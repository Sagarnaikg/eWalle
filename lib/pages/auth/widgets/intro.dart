import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppMedia.getIcon("logo.svg"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "eWalle",
                style: TextStyle(
                  color: AppColor.COLOR_1B1D28,
                  fontSize: 30,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "Open An Account For Digital  E-Wallet Solutions. Instant Payouts. ",
            style: TextStyle(
              color: AppColor.COLOR_7B7F9E,
              fontSize: 16,
              fontWeight: AppFontWeight.regular,
              height: 1.7,
            ),
          ),
          Text(
            "Join For Free.",
            style: TextStyle(
              color: AppColor.COLOR_7B7F9E,
              fontSize: 16,
              fontWeight: AppFontWeight.regular,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 1,
          ),
          SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
