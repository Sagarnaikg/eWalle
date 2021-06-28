import 'package:ewalle/pages/home/bloc.dart';
import 'package:ewalle/pages/home/widgets/app_bar.dart';
import 'package:ewalle/pages/home/widgets/balance_card.dart';
import 'package:ewalle/pages/home/widgets/menu.dart';
import 'package:ewalle/pages/home/widgets/send_money.dart';
import 'package:ewalle/pages/home/widgets/services.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:flutter/material.dart';
import 'widgets/buttons.dart';

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
          BackgroundWidget(bloc: bloc, context: context),
          TopScreen(bloc: bloc),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class TopScreen extends StatelessWidget {
  const TopScreen({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
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
                  CustomAppBar(bloc: bloc, context: context),
                  Expanded(
                    flex: 90,
                    child: StreamBuilder<dynamic>(
                        stream: bloc.homePageStream,
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return IndexedStack(
                              index: snapshot.data,
                              children: [
                                HomeWidget(),
                                Page(title: "Profile"),
                                Page(title: "Accounts"),
                                Page(title: "Transactions"),
                                Page(title: "Stats"),
                                Page(title: "Settings"),
                                Page(title: "Help"),
                              ],
                            );
                          } else {
                            return HomeWidget();
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.bloc,
    required this.context,
  }) : super(key: key);

  final HomeBloc bloc;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: ManuDrawerAppBar(bloc: bloc),
        ),
        Expanded(
          flex: 65,
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: MenuWidget(context: context, bloc: bloc),
              ),
              Expanded(
                flex: 50,
                child: Container(),
              ),
            ],
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
                LogOutButton(context: context),
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

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          BalanceCard(),
          SizedBox(height: 30),
          SendMoneyWidget(),
          SizedBox(height: 10),
          ServicesWidget(),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: AppColor.COLOR_3A4276,
          ),
        ),
      ),
    );
  }
}
