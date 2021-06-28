import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubTitleIcon extends StatelessWidget {
  const SubTitleIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColor.COLOR_3A4276,
              fontSize: 16,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppMedia.getIcon(icon),
                /*   height: 16, */
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.COLOR_3A4276,
          fontSize: 16,
          fontWeight: AppFontWeight.semiBold,
        ),
      ),
    );
  }
}
