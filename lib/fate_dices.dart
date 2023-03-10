import 'dart:math';

import 'package:fate_dices/widget/fate_dice_widget.dart';
import 'package:flutter/material.dart';

class FateDices extends StatefulWidget {
  const FateDices({super.key});

  @override
  State<FateDices> createState() => _FateDicesState();
}

class _FateDicesState extends State<FateDices> {
  ValueNotifier<String> dice1 = ValueNotifier<String>('');
  ValueNotifier<String> dice2 = ValueNotifier<String>('');
  ValueNotifier<String> dice3 = ValueNotifier<String>('');
  ValueNotifier<String> dice4 = ValueNotifier<String>('');
  ValueNotifier<String> pontuation = ValueNotifier<String>('');
  ValueNotifier<List> historic = ValueNotifier<List>([]);

  @override
  Widget build(BuildContext context) {
    getValue() {
      List values = ['+', '-', 'O', '+', '-', 'O'];
      var rng = Random();
      var index = rng.nextInt(4);
      return values[index];
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) => const Divider(),
                        separatorBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              historic.value[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        itemCount: historic.value.length));
              });
        },
        child: const Icon(Icons.history),
      ),
      appBar: AppBar(
        title: const Text('Dados Fate'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                dice1.value = getValue();
                dice2.value = getValue();
                dice3.value = getValue();
                dice4.value = getValue();
              });

              int diceSum = 0;
              List diceList = [
                dice1.value,
                dice2.value,
                dice3.value,
                dice4.value
              ];

              for (var element in diceList) {
                if (element == '+') {
                  diceSum += 1;
                } else if (element == '-') {
                  diceSum -= 1;
                }
              }
              setState(() {
                if (diceSum == -4) {
                  pontuation.value = 'Desastroso: $diceSum';
                } else if (diceSum == -3) {
                  pontuation.value = 'Horr??vel: $diceSum';
                } else if (diceSum == -2) {
                  pontuation.value = 'P??ssimo: $diceSum';
                } else if (diceSum == -1) {
                  pontuation.value = 'Ruim: $diceSum';
                } else if (diceSum == 0) {
                  pontuation.value = 'Med??ocre: $diceSum';
                } else if (diceSum == 1) {
                  pontuation.value = 'Razo??vel: $diceSum';
                } else if (diceSum == 2) {
                  pontuation.value = 'Bom: $diceSum';
                } else if (diceSum == 3) {
                  pontuation.value = '??timo: $diceSum';
                } else if (diceSum == 4) {
                  pontuation.value = 'Excepcional: $diceSum';
                }
                historic.value.add(
                    '${dice1.value} ${dice2.value} ${dice3.value} ${dice4.value} = $diceSum');
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FateDice(
                      sideValue: dice1.value,
                    ),
                    FateDice(
                      sideValue: dice2.value,
                    )
                  ],
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FateDice(
                      sideValue: dice3.value,
                    ),
                    FateDice(
                      sideValue: dice4.value,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              pontuation.value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
