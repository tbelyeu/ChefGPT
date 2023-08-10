import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:chefgpt/widgets/ordered_list.dart';
import 'package:chefgpt/widgets/unordered_list.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SavedRecipeCard extends StatelessWidget {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  const SavedRecipeCard(
      {super.key,
      required this.title,
      required this.ingredients,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    ExpandableController expandableController =
        ExpandableController(initialExpanded: true);

    return Card(
      elevation: 2,
      color: light,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExpandablePanel(
          controller: expandableController,
          header: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.share,
                  color: dark,
                ),
                iconSize: 32,
                color: dark,
                hoverColor: Colors.transparent,
                splashRadius: 0.01,
                onPressed: () {
                  // TODO:: implement sharing
                },
              ),
            ],
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Ingredients",
                size: 20,
                color: darkGrey,
              ),
              UnorderedList(ingredients),
              const CustomText(
                text: "Instructions",
                size: 20,
                color: darkGrey,
              ),
              OrderedList(instructions),
            ],
          ),
          collapsed: Container(),
          theme: const ExpandableThemeData(
            iconColor: dark,
            iconSize: 32,
            useInkWell: false,
            tapHeaderToExpand: true,
          ),
        ),
      ),
    );
  }
}
