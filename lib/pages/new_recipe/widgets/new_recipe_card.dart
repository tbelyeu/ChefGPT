import 'package:chefgpt/constants/controllers.dart';
import 'package:chefgpt/constants/style.dart';
import 'package:chefgpt/widgets/ordered_list.dart';
import 'package:chefgpt/widgets/unordered_list.dart';
import 'package:chefgpt/widgets/custom_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRecipeCard extends StatelessWidget {
  final String title;
  final List<String> ingredients;
  final List<String> instructions;
  final int index;
  const NewRecipeCard(
      {super.key,
      required this.title,
      required this.ingredients,
      required this.instructions,
      required this.index});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
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
              CustomText(
                text: title,
                size: 24,
              ),
              Expanded(
                child: Container(),
              ),
              Obx(
                () => IconButton(
                  icon: newRecipeController.recipeStarred[index]
                      ? Icon(
                          Icons.star,
                          color: Colors.amber.shade300,
                        )
                      : const Icon(
                          Icons.star_border,
                          color: dark,
                        ),
                  iconSize: 32,
                  color: dark,
                  hoverColor: Colors.transparent,
                  splashRadius: 0.01,
                  onPressed: () {
                    newRecipeController.toggleRecipeStarred(index);
                  },
                ),
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
    // return Card(
    //   elevation: 2,
    //   color: light,
    //   child: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             CustomText(
    //               text: title,
    //               size: 24,
    //             ),
    //             Expanded(
    //               child: Container(),
    //             ),
    //             Obx(
    //               () => IconButton(
    //                 icon: newRecipeController.recipeStarred[index]
    //                     ? Icon(
    //                         Icons.star,
    //                         color: Colors.amber.shade300,
    //                       )
    //                     : const Icon(
    //                         Icons.star_border,
    //                         color: dark,
    //                       ),
    //                 iconSize: 32,
    //                 color: dark,
    //                 hoverColor: Colors.transparent,
    //                 splashRadius: 0.01,
    //                 onPressed: () {
    //                   newRecipeController.toggleRecipeStarred(index);
    //                 },
    //               ),
    //             ),
    //             Obx(
    //               () => AnimatedRotation(
    //                 turns: newRecipeController.turns.value,
    //                 duration: const Duration(milliseconds: 200),
    //                 child: IconButton(
    //                   icon: const Icon(Icons.expand_more),
    //                   iconSize: 32,
    //                   hoverColor: Colors.transparent,
    //                   splashRadius: 0.01,
    //                   onPressed: () {
    //                     newRecipeController.rotateIcon();
    //                     newRecipeController.toggleCardExpanded();
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         Obx(
    //           () => Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: newRecipeController.cardIsExpanded.value
    //                 ? [
    //                     const CustomText(
    //                       text: "Ingredients",
    //                       size: 20,
    //                       color: darkGrey,
    //                     ),
    //                     UnorderedList(ingredients),
    //                     const CustomText(
    //                       text: "Instructions",
    //                       size: 20,
    //                       color: darkGrey,
    //                     ),
    //                     OrderedList(instructions),
    //                   ]
    //                 : [],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
