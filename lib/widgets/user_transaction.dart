import 'package:flutter/material.dart';
import 'package:moncomptable/models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    /*  Transaction(id: "t1", title: "new shoes", amount: 10, date: DateTime.now()),
    Transaction(
        id: "t2", title: "new shoes grey", amount: 10, date: DateTime.now()), */
  ];
  //manage a list of transaction
  void _newTransactions(String nTTitle, double nTAmount) {
    final newTrans = Transaction(
        id: DateTime.now().toString(),
        title: nTTitle,
        amount: nTAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewTransaction(_newTransactions),
        TransactionList(_userTransactions),
      ],
    );
  }
}
