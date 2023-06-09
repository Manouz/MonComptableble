import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.label,this.spendingAmount,this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text("\$${spendingAmount.toStringAsFixed(0)}"),
         SizedBox(height: 4),
        Container(
          height: 60,
          width:10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                  
                ),
              ),
              FractionallySizedBox(heightFactor: spendingPctOfTotal,child: Container(decoration: BoxDecoration(
                color: Theme.of(context).indicatorColor,
                borderRadius: BorderRadius.circular(10)
              ),),)
            ],
          ),
        )

      ],
    );
  }
}
