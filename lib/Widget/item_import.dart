import 'package:flutter/material.dart';

class ItemImport extends StatefulWidget {
  const ItemImport({
    Key? key,
    this.columnTitle,
    this.width,
    this.prefixText,
    this.labelText,
    this.icon,
    this.controller,
  }) : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final controller;

  @override
  State<ItemImport> createState() => _ItemImportState();
}

class _ItemImportState extends State<ItemImport> {
  TextEditingController indexController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController supplierController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ItemImportFilter(
              columnTitle: 'Item Code',
              //width: 128,
              labelText: 'Item Code',
              prefixText: '#',
              hintText: '000 000 000',
              icon: const Icon(Icons.search),
              controller: indexController,
            ),
            ItemImportFilter(
              columnTitle: 'Item Title',
              //width: 196,
              labelText: 'Item Title',
              hintText: 'e.g. Screw M4x12',
              icon: const Icon(Icons.search),
              controller: nameController,
            ),
            ItemImportFilter(
              columnTitle: 'Description',
              //width: 256,
              labelText: 'Description',
              hintText: 'e.g. flathead screw',
              icon: const Icon(Icons.search),
              controller: descriptionController,
            ),
            ItemImportFilter(
              columnTitle: 'Stock',
              //width: 128,
              labelText: 'Stock',
              hintText: 'e.g. >100',
              icon: const Icon(Icons.search),
              controller: stockController,
            ),
            ItemImportFilter(
              columnTitle: 'Supplier',
              //width: 128,
              labelText: 'Supplier',
              hintText: 'e.g. Amazon',
              icon: const Icon(Icons.search),
              controller: supplierController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 32),
              child: SizedBox(
                height: 48,
                width: 256,
                child: ElevatedButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.lightBlue,
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          icon: ButtonBar(
                            alignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                                tooltip: 'Edit Item',
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Index", maxLines: 2),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Item title",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.lightBlue),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Description"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Text('Supplier: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("Supplier"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Text('Stock: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text("Stock"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  /*context.read<FileController>().writeText()*/
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.add_circle),
                      Text('Add Item to Inventory'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Filter Widget
class ItemImportFilter extends StatefulWidget {
  const ItemImportFilter({
    Key? key,
    this.columnTitle,
    this.width,
    this.prefixText,
    this.labelText,
    this.hintText,
    this.icon,
    this.controller,
    this.onEditingComplete,
  }) : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final hintText;
  final icon;
  final controller;
  final onEditingComplete;

  @override
  State<ItemImportFilter> createState() => _ItemImportFilterState();
}

class _ItemImportFilterState extends State<ItemImportFilter> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: SizedBox(
        width: 256,
        height: 60,
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            suffixStyle: const TextStyle(fontSize: 14),
            prefixText: widget.prefixText,
            //icon: widget.icon,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hoverColor: Colors.orange,
            contentPadding: const EdgeInsets.all(2),
          ),
        ),
      ),
    );
  }

  /* String getInput() {
    return controller.text;
  }*/
}
