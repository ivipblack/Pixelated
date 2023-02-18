import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pixelated/constants/colors.dart';
import 'package:pixelated/data/view_models/orderVm.dart';
import 'package:pixelated/widgets/order/order_card.dart';

class OrderContainer extends HookWidget {
  OrderContainer({super.key});
  String selectedBeverage = '';
  String selectedSide = '';
  String selectedSweet = '';

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');

    final beverageSelectedIndex = useState(-1);
    final sideSelectedIndex = useState(-1);
    final sweetSelectedIndex = useState(-1);
    final isKhobuzSelected = useState(false);
    //get user id
    final userID = FirebaseAuth.instance.currentUser!.uid;
    final phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 18, 30, 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyColors.myCream,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/brosted.png',
            ),
            Expanded(
              child: ListView(
                children: [
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
                        .map(
                          (beverageCard) => OrderCard(
                            orderModel: beverageCard,
                            onTap: () {
                              beverageSelectedIndex.value =
                                  OrderVM.beverageList.indexOf(beverageCard);
                              selectedBeverage = OrderVM
                                  .beverageList[beverageSelectedIndex.value]
                                  .label;
                            },
                            isSelected: beverageSelectedIndex.value ==
                                OrderVM.beverageList.indexOf(beverageCard),
                          ),
                        )
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
                              onTap: () {
                                sweetSelectedIndex.value =
                                    OrderVM.sweetList.indexOf(beverageCard);
                                selectedSweet = OrderVM
                                    .sweetList[sweetSelectedIndex.value].label;
                              },
                              isSelected: sweetSelectedIndex.value ==
                                  OrderVM.sweetList.indexOf(beverageCard),
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
                              onTap: () {
                                sideSelectedIndex.value =
                                    OrderVM.sidesList.indexOf(beverageCard);

                                selectedSide = OrderVM
                                    .sidesList[sideSelectedIndex.value].label;
                              },
                              isSelected: sideSelectedIndex.value ==
                                  OrderVM.sidesList.indexOf(beverageCard),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Align(
                          child: Text(
                            'Add Khobuz ?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Checkbox(
                          value: isKhobuzSelected.value,
                          onChanged: (value) {
                            isKhobuzSelected.value = value!;
                            print(isKhobuzSelected.value);
                          }),
                    ],
                  ),
                  //textfield
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Special Instructions',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  //make a textfield with padding without border
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'What do you prefer?',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 52,
                width: 335,
                decoration: BoxDecoration(
                  color: MyColors.myOrange,
                  borderRadius: BorderRadius.circular(32),
                ),
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
          ],
        ),
      ),
    );
  }
}
