import 'package:ewalle/pages/home/widgets/titles.dart';
import 'package:ewalle/resources/colors.dart';
import 'package:ewalle/resources/font_weights.dart';
import 'package:ewalle/resources/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Map> services = [
  {
    "name": "Send\nMoney",
    "image": "send-money.svg",
  },
  {
    "name": "Receive\nMoney",
    "image": "receive.svg",
  },
  {
    "name": "Mobile\nPrepaid",
    "image": "mobile.svg",
  },
  {
    "name": "Electricity\nBill",
    "image": "electric.svg",
  },
  {
    "name": "Cashback\nOffer",
    "image": "offers.svg",
  },
  {
    "name": "Movie\nTickets",
    "image": "tickets.svg",
  },
  {
    "name": "Flight\nTickets",
    "image": "flight.svg",
  },
  {
    "name": "More\nOptions",
    "image": "options.svg",
  },
];

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitleIcon(icon: "filter.svg", title: "Services"),
        SizedBox(height: 30),
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: services
              .map(
                (service) => ServiceCard(
                  image: service["image"],
                  name: service["name"],
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColor.COLOR_F1F3F6,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(20),
          child: SvgPicture.asset(AppMedia.getIcon(
            image,
          )),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColor.COLOR_7B7F9E,
            fontSize: 14,
            height: 1.5,
            fontWeight: AppFontWeight.regular,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
