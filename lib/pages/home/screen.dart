import 'package:ewalle/pages/home/bloc.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.COLOR_F1F3F6,
      body: Stack(
        children: [
          getBackground(),
          getTopScreen(),
        ],
      ),
    );
  }

  Widget getTopScreen() {
    return StreamBuilder<dynamic>(
        stream: bloc.positionStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              transform:
                  Matrix4.translationValues(snapshot.data.x, snapshot.data.y, 0)
                    ..scale(snapshot.data.scale)
                    ..rotateZ(snapshot.data.angle),
              decoration: BoxDecoration(
                color: AppColor.COLOR_FFFFFF,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                      bloc.menuStateController.value == MENU_STATE.CLOSE
                          ? 0
                          : 30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppMedia.getIcon("logo.svg"),
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "eWalle",
                              style: TextStyle(
                                color: AppColor.COLOR_1B1D28,
                                fontSize: 30,
                                fontWeight: AppFontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                double x =
                                    MediaQuery.of(context).size.width * 0.5;
                                double y =
                                    MediaQuery.of(context).size.height * 0.23;

                                bloc.setPositionStream!(PositionOffset(
                                    x: x, y: y, scale: 0.6, angle: -0.261799));
                                bloc.setmenuStateStream!(MENU_STATE.OPEN);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  AppMedia.getIcon("menu.svg"),
                                  height: 22,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 25,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Account Overview",
                              style: TextStyle(
                                color: AppColor.COLOR_3A4276,
                                fontSize: 16,
                                fontWeight: AppFontWeight.semiBold,
                              ),
                            ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: AppColor.COLOR_FFAC30,
                                      child: SvgPicture.asset(
                                        AppMedia.getIcon("add.svg"),
                                        height: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 25,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Send Money",
                                    style: TextStyle(
                                      color: AppColor.COLOR_3A4276,
                                      fontSize: 16,
                                      fontWeight: AppFontWeight.semiBold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppMedia.getIcon("scan.svg"),
                                        /*   height: 16, */
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 180,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          color: AppColor.COLOR_FFAC30,
                                          child: SvgPicture.asset(
                                            AppMedia.getIcon("add.svg"),
                                            height: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 130,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.COLOR_F1F3F6,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              color: AppColor.COLOR_FFFFFF,
                                              child: SvgPicture.asset(
                                                  AppMedia.getImage(
                                                      "avatar03.svg")),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Mike",
                                            style: TextStyle(
                                              color: AppColor.COLOR_3A4276,
                                              fontSize: 14,
                                              letterSpacing: 0.8,
                                              fontWeight: AppFontWeight.regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 130,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.COLOR_F1F3F6,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              color: AppColor.COLOR_FFFFFF,
                                              child: SvgPicture.asset(
                                                  AppMedia.getImage(
                                                      "avatar04.svg")),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Joshpeh",
                                            style: TextStyle(
                                              color: AppColor.COLOR_3A4276,
                                              fontSize: 14,
                                              letterSpacing: 0.8,
                                              fontWeight: AppFontWeight.regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 130,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.COLOR_F1F3F6,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              color: AppColor.COLOR_FFFFFF,
                                              child: SvgPicture.asset(
                                                  AppMedia.getImage(
                                                      "avatar02.svg")),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Ashley",
                                            style: TextStyle(
                                              color: AppColor.COLOR_3A4276,
                                              fontSize: 14,
                                              letterSpacing: 0.8,
                                              fontWeight: AppFontWeight.regular,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Services",
                                    style: TextStyle(
                                      color: AppColor.COLOR_3A4276,
                                      fontSize: 16,
                                      fontWeight: AppFontWeight.semiBold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppMedia.getIcon("filter.svg"),
                                        /*   height: 16, */
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: GridView.count(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                mainAxisSpacing: 5,
                                primary: false,
                                childAspectRatio: 1 / 1.3,
                                crossAxisCount: 4,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "send-money.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Send\nMoney",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "receive.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Receive\nMoney",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "mobile.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Mobile\nPrepaid",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "electric.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Electricity\nBill",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "offers.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Cashback\nOffer",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "tickets.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Movie\nTickets",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "flight.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Flight\nTickets",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          color: AppColor.COLOR_F1F3F6,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: EdgeInsets.all(20),
                                        child:
                                            SvgPicture.asset(AppMedia.getIcon(
                                          "options.svg",
                                        )),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "More\nOptions",
                                        style: TextStyle(
                                          color: AppColor.COLOR_7B7F9E,
                                          fontSize: 14,
                                          height: 1.5,
                                          fontWeight: AppFontWeight.regular,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget getBackground() {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 60,
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.COLOR_FFFFFF,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(70),
                        ),
                      ),
                      child: SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: AppColor.COLOR_F1F3F6,
                                child: SvgPicture.asset(
                                  AppMedia.getImage("avatar01.svg"),
                                  width: 50,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Carol Black",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 20,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                                Text(
                                  "Seattle,Washington",
                                  style: TextStyle(
                                    color: AppColor.COLOR_7B7F9E,
                                    fontSize: 14,
                                    fontWeight: AppFontWeight.regular,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 40,
                  child: SafeArea(
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          bloc.setPositionStream!(
                              PositionOffset(x: 0, y: 0, scale: 1, angle: 0));
                          bloc.setmenuStateStream!(MENU_STATE.CLOSE);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            AppMedia.getIcon("close.svg"),
                            height: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 65,
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 50,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_FFAC30,
                                  ),
                                )),
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Accounts",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Transactions",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Stats",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 7,
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                  left: BorderSide(
                                    width: 5,
                                    color: AppColor.COLOR_F1F3F6,
                                  ),
                                )),
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                    color: AppColor.COLOR_1B1D28,
                                    fontSize: 18,
                                    fontWeight: AppFontWeight.semiBold,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppMedia.getIcon("logout.svg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: AppColor.COLOR_1B1D28,
                        fontSize: 20,
                        fontWeight: AppFontWeight.semiBold,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    color: AppColor.COLOR_7B7F9E,
                    fontSize: 14,
                    letterSpacing: 0.8,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
