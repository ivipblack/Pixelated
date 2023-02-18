import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelated/data/models/order_card_module.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.onTap,
    required this.orderModel,
  });

  final VoidCallback onTap;
  final OrderCardModel orderModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width * 0.16);
    return Container(
      //make a box height and width
      height: height * 0.075,
      width: width * 0.16,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -2,
            blurRadius: 7,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SvgPicture.asset(
            orderModel.iconPath,
            color: Colors.grey,
          ),
          Text(
            orderModel.label,
            style: const TextStyle(
              height: 0.5,
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ]),
      ),
    );
  }
}
