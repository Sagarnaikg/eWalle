import 'package:rxdart/rxdart.dart';

enum MENU_STATE { OPEN, CLOSE }

class HomeBloc {
  final _positionController = BehaviorSubject<PositionOffset>.seeded(
      PositionOffset(x: 0, y: 0, scale: 1, angle: 0));

  Stream<PositionOffset> get positionStream => _positionController.stream;

  Function(PositionOffset)? get setPositionStream =>
      _positionController.isClosed ? null : _positionController.sink.add;

  final menuStateController =
      BehaviorSubject<MENU_STATE>.seeded(MENU_STATE.CLOSE);

  Stream<MENU_STATE> get menuStateStream => menuStateController.stream;

  Function(MENU_STATE)? get setmenuStateStream =>
      menuStateController.isClosed ? null : menuStateController.sink.add;

  final homePageController = BehaviorSubject<int>.seeded(0);

  Stream<int> get homePageStream => homePageController.stream;

  Function(int)? get setHomePageStream =>
      homePageController.isClosed ? null : homePageController.sink.add;

  void dispose() {
    _positionController.close();
    menuStateController.close();
    homePageController.close();
  }
}

class PositionOffset {
  double x;
  double y;
  double scale;
  double angle;
  PositionOffset(
      {required this.x,
      required this.y,
      required this.scale,
      required this.angle});
}
