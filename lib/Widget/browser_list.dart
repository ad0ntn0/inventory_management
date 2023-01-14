import 'package:flutter/material.dart';
import 'package:inventory_management/Widget/product_detailview.dart';
import 'package:inventory_management/Widget/browser_filter.dart';

class BrowserList extends StatefulWidget {
  const BrowserList({Key? key}) : super(key: key);

  @override
  State<BrowserList> createState() => _BrowserListState();
}

class _BrowserListState extends State<BrowserList> {


  @override
  Widget build(BuildContext context) {
    return BrowserFilter().foundItems.isNotEmpty
        ? ListView.builder(
      //itemExtent: 144,
        clipBehavior: Clip.antiAlias,
        shrinkWrap: true,
        itemCount: BrowserFilter().foundItems.length,
        itemBuilder: (BuildContext context, int index) {

          //Defines Card Style
          return Card(
            key: ValueKey(BrowserFilter().foundItems[index]["Index"]),
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            //color: Colors.lightBlue,
            elevation: 10,
            //Defines interactive Card
            child: InkWell(
              enableFeedback: true,
              excludeFromSemantics: true,
              splashColor: Colors.grey.shade600,
              radius: 64,
              borderRadius: const BorderRadius.all(
                  Radius.circular(10)),
              onTap: () {
                //Opens a Popup Window with a more in-depth item view
                showDialog(
                  context: context,
                  builder: (context) {
                    return (const ProductDetailView()
                    );
                  },
                );
              },
              //
              child: ListTile(
                minLeadingWidth: 64,
                hoverColor: Colors.lightBlue,
                contentPadding: const EdgeInsets.all(8),
                minVerticalPadding: 16,
                //tileColor: Colors.white,
                //horizontalTitleGap: 10,
                style: ListTileStyle.list,

                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '#$index$index',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.lightBlue),
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Stock '),
                    Text(
                      BrowserFilter().foundItems[index]["Stock"]
                          .toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                title: Text(
                  BrowserFilter().foundItems[index]["Index"].toString(),
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8),
                      child: Text(
                        BrowserFilter().foundItems[index]["Item title"]
                            .toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0),
                      child: Text(
                          BrowserFilter().foundItems[index]["Description"]
                              .toString(),
                          maxLines: 4),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Supplier: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          BrowserFilter().foundItems[index]["Supplier"]
                              .toString(),
                        ),
                      ],
                    ),
                  ],
                ),

                // isThreeLine: true,
              ),
            ),
          );
        })
        : const Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text(
          'No results found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

}
