import 'package:flutter/material.dart';
import 'package:moneytracker/view/components/add_transaction_dialog.dart';
import 'package:moneytracker/view/components/home_header.dart';
import 'package:moneytracker/view/components/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          HomeHeader(), 
          TransactionsList()
          ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          // mostrar un bottom sheet para agregar una transacción
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddTransactionDialog(
              );
            },
          );
        } , 
        child: const Icon(
          Icons.add,
          color: Colors.white)
      ),
    );
  }
}
