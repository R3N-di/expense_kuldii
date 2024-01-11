import 'package:flutter/material.dart';
import 'package:expense_kuldii/app/constant/color.dart';

class CardExpense extends StatelessWidget {
  const CardExpense({
    Key? key,
    required this.data,
    // super.key,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 40),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: data['warnaLatar'] ?? appBlueSoft,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(
              // "assets/icons/shopping-bag.png",
              data['image'],
              color: data['warnaLogo'] ?? appBlue,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        // "Shopping",
                        data['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        data['amount'],
                        // "- \$500",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: appRed),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['subtitle'],
                      // "Buy some grocery",
                      style: TextStyle(color: appTextSoft),
                    ),
                    Text(
                      data['time'],
                      // "11:00 AM",
                      style: TextStyle(color: appTextSoft),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
