
import 'package:flutter/material.dart';
import 'package:moneytracker/controller/transactions_provider.dart';
import 'package:moneytracker/view/widgets/header_card.dart';
import 'package:provider/provider.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context); 
    final balance = provider.getBalance();
    final incomes = provider.getTotalIncome();
    final expenses = provider.getTotalExpenses();

    return SizedBox(
    
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            'MONEY TRACKER',
            style: textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade900,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Balance:',
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white54,
            ),
          ),
          Text(
            '\$ ${balance.toStringAsFixed(2)}',
            style: textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                headerCard(
                  title: 'Income',
                  amount: incomes,
                  icon: const Icon(
                    Icons.attach_money,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(width: 12),
                headerCard(
                  title: 'Expenses',
                  amount: expenses,
                  icon: const Icon(
                    Icons.money_off,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
