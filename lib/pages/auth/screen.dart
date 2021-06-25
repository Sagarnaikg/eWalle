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
                  child: Column(
                children: [],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
