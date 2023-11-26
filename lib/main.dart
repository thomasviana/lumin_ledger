/// "LuminLedger" as a name for a finance tracking app with AI capabilities carries a blend of meanings and connotations:
///
/// Lumin: This part of the name derives from "luminous" or "illumination", suggesting clarity, enlightenment, and insight.
/// In the context of a finance app, it implies bringing light to financial situations, offering clear and insightful views on personal finances.
///
/// Ledger: A ledger is a traditional term in finance and accounting, referring to a book or other collection of financial accounts.
/// In a modern context, it often refers to detailed records of transactions. This part of the name anchors the app in the world of finance,
/// implying robust tracking and management of financial records.
///
/// Combined, "LuminLedger" suggests an app that illuminates financial paths, providing clear, insightful, and comprehensive management of personal finances.
/// It conveys the idea of an intelligent, AI-driven tool that makes financial record-keeping and analysis both transparent and accessible.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
