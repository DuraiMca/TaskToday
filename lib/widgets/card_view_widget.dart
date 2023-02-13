import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:tasktoday/widgets/explore_list_item.dart';

import '../Model/usermodel.dart';

class CardViewList extends StatelessWidget {
  List<Tasks> itemList = <Tasks>[];
  CardViewList(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ExploreListItemView(itemList, index);
              }),
        ],
      ),
    );
  }
}
