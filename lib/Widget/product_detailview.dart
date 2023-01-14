import 'package:flutter/material.dart';
import 'package:inventory_management/Widget/browser_filter.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {

  final int _index = 0;

  int get index => _index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(16))),
      icon: ButtonBar(
        alignment:
        MainAxisAlignment.spaceBetween,
        children: [
          BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            onPressed: () {
              print("Edit Button pressed");
            },
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Item',
            style: const ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(
                    Colors.lightBlue)),
            /* focusColor:
                                                Colors.lightBlue,
                                                autofocus: true,*/
            hoverColor: Colors.lightBlue,
          ),
        ],
      ),
      title: Row(
        children: const [
          Text("Details"),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Text(
                BrowserFilter().foundItems[index]["Index"]
                    .toString(),
                maxLines: 2),
          ),
          Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Text(
              BrowserFilter().foundItems[index]
              ["Item title"],
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description: ',
                  style: TextStyle(
                      fontWeight:
                      FontWeight.bold),
                ),
                Text(BrowserFilter().foundItems[index]
                ["Description"]),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Supplier: ',
                    style: TextStyle(
                        fontWeight:
                        FontWeight
                            .bold)),
                Text(BrowserFilter().foundItems[index]
                ["Supplier"]
                    .toString()),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('Stock: ',
                    style: TextStyle(
                        fontWeight:
                        FontWeight
                            .bold)),
                Text(BrowserFilter().foundItems[index]
                ["Stock"]
                    .toString()),
              ],
            ),
          ),
        ],
      ),
    );

}
}