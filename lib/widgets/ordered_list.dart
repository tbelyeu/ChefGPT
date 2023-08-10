import 'package:chefgpt/constants/style.dart';
import 'package:flutter/material.dart';

class OrderedList extends StatelessWidget {
  final List<String> strings;

  const OrderedList(this.strings, {super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${i += 1}. ",
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.55,
                  color: darkGrey,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 16,
                    color: darkGrey,
                    height: 1.55,
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
