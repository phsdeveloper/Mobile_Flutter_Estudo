import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class TransactionList extends StatelessWidget {
   const TransactionList(this.transactions,{super.key});

final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {

    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR', null);

    return SizedBox(
      height: 430,
      child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) 
              {
                final tr = transactions[index];
                  return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      //-----------------------------------------------------------------------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y HH:mm:ss').format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      //-------------------------------------------------------------------------------
                    ],
                  ),
                );
              },
            ),
    );
  }
}