import 'package:ewalle/pages/home/widgets/buttons.dart';
import 'package:ewalle/pages/home/widgets/titles.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SubTitle(title: "Account Overview"),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.COLOR_F1F3F6,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "20,000",
                      style: TextStyle(
                        color: AppColor.COLOR_171822,
                        fontSize: 28,
                        fontWeight: AppFontWeight.semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Current balance",
                      style: TextStyle(
                        color: AppColor.COLOR_3A4276,
                        fontSize: 14,
                        letterSpacing: 0.8,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                  ],
                ),
                AddButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
