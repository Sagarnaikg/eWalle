import 'package:ewalle/pages/home/widgets/buttons.dart';
import 'package:ewalle/pages/home/widgets/titles.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendMoneyWidget extends StatelessWidget {
  const SendMoneyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SubTitleIcon(title: "Send Money", icon: "scan.svg"),
          Container(
            height: 180,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: AddButton(),
                    ),
                    AccountCard(image: "avatar03.svg", name: "Mike"),
                    AccountCard(image: "avatar04.svg", name: "Joshpeh"),
                    AccountCard(image: "avatar02.svg", name: "Ashley"),
                    AccountCard(image: "avatar03.svg", name: "Mike"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: AppColor.COLOR_F1F3F6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              alignment: Alignment.bottomCenter,
              color: AppColor.COLOR_FFFFFF,
              child: SvgPicture.asset(AppMedia.getImage(image)),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: TextStyle(
              color: AppColor.COLOR_3A4276,
              fontSize: 14,
              letterSpacing: 0.8,
              fontWeight: AppFontWeight.regular,
            ),
          ),
        ],
      ),
    );
  }
}
