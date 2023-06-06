import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  List<Transaction> transactions = [
    Transaction(id: "t1", title: "new shoes", amount: 10, date: DateTime.now()),
    Transaction(
        id: "t2", title: "new shoes grey", amount: 10, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Comptable"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child:
                Container(/* width: double.infinity, */ child: Text("chart")),
          ),
          Card(
            child: Container(/* width: double.infinity, */ child: Text("data")),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: transactions.map((tx) {
                return Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.purple),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          tx.date.toString(),
                          style: TextStyle(fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                );
              }).toList())
        ],
      ),
    );
  }
}
