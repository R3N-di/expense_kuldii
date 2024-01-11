import 'package:expense_kuldii/app/constant/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';


class InfoBalance extends StatelessWidget {
  const InfoBalance({
    required this.isIncome,
    required this.balance,
    super.key,
  });

  final bool isIncome;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: Get.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(25),
          color: isIncome == true ? appGreen : appRed),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            child:
                // Icon(
                //   Icons.attach_money_outlined,
                //   size: 35,
                // ),
                Image.asset(
              isIncome == true ? "assets/icons/income.png" : "assets/icons/outcome.png",
              scale: 15,
              color: isIncome == true ? appGreen : appRed,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isIncome == true ? "Income" : "Outcome",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                FittedBox(
                  child: Text(
                    "\$${balance}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        letterSpacing: 1.1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}