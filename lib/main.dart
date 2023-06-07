import 'package:flutter/material.dart';
import 'package:moncomptable/widgets/chart.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        fontFamily: 'Quicksand',
        // appBarTheme: AppBarTheme()
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "new shoes", amount: 10, date: DateTime.now()),
    Transaction(
        id: "t2", title: "new shoes grey", amount: 10, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  //manage a list of transaction
  void _addnewTransactions(String nTTitle, double nTAmount) {
    final newTrans = Transaction(
        id: DateTime.now().toString(),
        title: nTTitle,
        amount: nTAmount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addnewTransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MonComptable"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            Container(
              child: Column(
                children: [TransactionList(_userTransactions)],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      /*  drawer: DrawerButton(
        onPressed: () {},
          fonts:
    - family: OpensSans
      fonts:
        - asset: fonts/OpensSans-Bold.ttf
        - asset: fonts/OpensSans-Regular.ttf
          weight: 700
    - family: Quicksand
      fonts:
        - asset: fonts/Quicksand-Bold.ttf
        - asset: fonts/TrajanPro_Regular.ttf
          weight: 700
      ), */
    );
  }
}
