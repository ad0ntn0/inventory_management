import 'package:flutter/material.dart';


class ItemImport extends StatefulWidget {
  const ItemImport(
      {Key? key,
        this.columnTitle,
        this.width,
        this.prefixText,
        this.labelText,
        this.icon})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;

  @override
  State<ItemImport> createState() => _ItemImportState();
}
class _ItemImportState extends State<ItemImport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(48,48,48,48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const ItemImportFilter(
              columnTitle: 'Item Code',
              //width: 128,
              labelText: 'Item Code',
              prefixText: '#',
              hintText: '000 000 000',
              icon: Icon(Icons.search),
            ),
            const ItemImportFilter(
              columnTitle: 'Item Title',
              //width: 196,
              labelText: 'Item Title',
              hintText: 'e.g. Screw M4x12',
              icon: Icon(Icons.search),
            ),
            const ItemImportFilter(
              columnTitle: 'Description',
              //width: 256,
              labelText: 'Description',
              hintText: 'e.g. flathead screw',
              icon: Icon(Icons.search),
            ),
            const ItemImportFilter(
              columnTitle: 'Stock',
              //width: 128,
              labelText: 'Stock',
              hintText: 'e.g. >100',
              icon: Icon(Icons.search),
            ),
            const ItemImportFilter(
              columnTitle: 'Supplier',
              //width: 128,
              labelText: 'Supplier',
              hintText: 'e.g. Amazon',
              icon: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 32),
              child: Container(
                height: 48,
                width: 256,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Icon(Icons.search),
                      Text(
                        'Add to Inventory',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                        ),
                      ),
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
  const ItemImportFilter(
      {Key? key,
        required this.columnTitle,
        this.width,
        this.prefixText,
        this.labelText,
        this.hintText,
        this.icon})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final hintText;
  final icon;

  @override
  State<ItemImportFilter> createState() => _ItemImportFilterState();
}

class _ItemImportFilterState extends State<ItemImportFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: SizedBox(
        width: 256,
        height: 60,
        child: TextFormField(
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
}