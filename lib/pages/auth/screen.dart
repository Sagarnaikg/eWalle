import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            SvgPicture.asset(
              AppMedia.getImage("illustration.svg"),
              height: MediaQuery.of(context).size.height,
            ),
            Expanded(
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: Column(
                  children: [
                    Expanded(
                      flex: 25,
                      child: Container(
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
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Container(
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
                              "Open An Account For Digital \nE-Wallet Solutions.Instant Payouts. ",
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
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 1),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.COLOR_FFAC30,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: AppColor.COLOR_212330,
                                      fontSize: 18,
                                      fontWeight: AppFontWeight.semiBold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SvgPicture.asset(
                                    AppMedia.getIcon("arrow-right.svg"),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Create an account",
                              style: TextStyle(
                                color: AppColor.COLOR_212330,
                                fontSize: 18,
                                fontWeight: AppFontWeight.semiBold,
                              ),
                            ),
                            SizedBox(height: 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
