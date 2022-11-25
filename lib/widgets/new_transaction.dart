import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountCountroller = TextEditingController();

  final Function(String, double) onSumbit;

  NewTransaction(this.onSumbit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   _titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountCountroller,
              // onChanged: (value) {
              //   _amountInput = value;
              // },
            ),
            TextButton(
              onPressed: () {
                onSumbit(titleController.value.text,
                    double.parse(amountCountroller.value.text));
              },
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
