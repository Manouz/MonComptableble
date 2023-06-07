import 'package:flutter/material.dart';
import 'package:moncomptable/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:moncomptable/widgets/chartbar.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalsum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekday).substring(0, 1));
      print(totalsum);
      return {'Day': DateFormat.E().format(weekday), "amount": totalsum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
       /*  children: groupedTransactionValue.map((e) {
          return ChartBar("${e['day']}", spendingAmount, e[total]),
        }).toList(), */
      ),
    );
  }
}
