import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
         child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "Destques do dia",
                  style: TextStyle(
                    fontFamily: "Caveat",
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ),
            MediaQuery.of(context).orientation == Orientation.landscape ? const _LandsscapeList() : const _PortraitList()
          ],
         ),
       );
  }
}

class _PortraitList extends StatelessWidget {
  const _PortraitList();

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return HighlightItem(
                    imageURI: items[index]["image"], 
                    itemTitle: items[index]["name"], 
                    itemPrice: items[index]["price"], 
                    itemDescription: items[index]["description"]
                  );
                },
                childCount: items.length,
              )
            );
  }
}

class _LandsscapeList extends StatelessWidget {
  const _LandsscapeList();

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
            imageURI: items[index]["image"], 
            itemTitle: items[index]["name"], 
            itemPrice: items[index]["price"], 
            itemDescription: items[index]["description"]
          );
        },
        childCount: items.length
      ), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.09
      )
    );
  }
}