import 'package:firebase_demo_app/transaction.dart';
import 'package:flutter/material.dart';
import 'list_item.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Center(
              child: Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          })
        : ListView(
            children: widget.transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                    ))
                .toList(),
          );
  }
}
