import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransaction;
  NewTransaction(this.newTransaction);
  final titleCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  void submitData() {
    final enteredTitle = titleCtrl.text;
    final enteredAmount = double.parse(amountCtrl.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    newTransaction(titleCtrl.text, double.parse(amountCtrl.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountCtrl,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Theme.of(context).indicatorColor),
              ),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
