import 'package:flutter/material.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/data/view_models/orderVm.dart';
import 'package:pixelated/screens/choose_meal.dart';
import 'package:pixelated/widgets/order/order_card.dart';

import '../../screens/payment_page.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 18, 30, 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyColors.myWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 20,
              spreadRadius: -12,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/brosted.png',
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Broasted',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //text
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Beverage',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: OrderVM.beverageList
                  .map((beverageCard) => OrderCard(
                        orderModel: beverageCard,
                        onTap: () {},
                      ))
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Side',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: OrderVM.sidesList
                  .map((beverageCard) => OrderCard(
                        orderModel: beverageCard,
                        onTap: () {},
                      ))
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sweet',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: OrderVM.sweetList
                  .map((beverageCard) => OrderCard(
                        orderModel: beverageCard,
                        onTap: () {},
                      ))
                  .toList(),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 64,
                  width: 335,
                  decoration: BoxDecoration(
                    color: MyColors.myOrange,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Total: 4.60 SAR',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Pay',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
