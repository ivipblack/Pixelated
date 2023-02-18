import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelated/data/models/order_card_module.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.onTap,
    required this.orderModel,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final OrderCardModel orderModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.075,
        width: width * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: isSelected ? 1 : -2,
              blurRadius: 7,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SvgPicture.asset(
              orderModel.iconPath,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                orderModel.label,
                style: const TextStyle(
                  height: 0.5,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
