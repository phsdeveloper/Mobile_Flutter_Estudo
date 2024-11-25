import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction, {super.key});

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (int i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      //print('Dia ${DateFormat.E().format(weekDay)} [${DateFormat.E().format(weekDay)[0]}] >> Total Sum: $totalSum');

      return {
        'day': DateFormat.E().format(weekDay).substring(0,3).toUpperCase(),
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum+(tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: double.parse(tr['value'].toString()),
                  percentage: _weekTotalValue==0? 0: (tr['value'] as double)/_weekTotalValue,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}