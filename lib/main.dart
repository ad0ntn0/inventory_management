import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management/Screens/login_screen.dart';
import 'package:inventory_management/Widget/browser_search_field.dart';
import 'package:provider/provider.dart';

import 'package:inventory_management/Widget/item_provider.dart';
import 'package:inventory_management/Widget/browser_filter.dart';


void main() {
  runApp(
    MultiProvider(providers: [

      ChangeNotifierProvider(create: (_) => ItemProvider()),
      ChangeNotifierProvider(create: (_) => BrowserFilter()),
      ChangeNotifierProvider(create: (_) => BrowserSearchField()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Manager',
      theme: _buildTheme(Brightness.dark),
      home: const LoginPage(),
      //home:  const InventoryBrowser(),
      //home:  const InventoryBrowser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
      //primarySwatch: Colors.green,
      //appBarTheme: const AppBarTheme(backgroundColor: Colors.lightBlue),
      textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
      primaryColor: Colors.lightBlue
      // primaryTextTheme: TextTheme(),
      );
}

/*

//Text Block for search results
class DataBlock extends StatefulWidget {
  const DataBlock(
      {Key? key,
      this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.icon,
      this.itemCode,
      this.itemTitle,
      this.description,
      this.stock,
      this.supplier})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final itemCode;
  final itemTitle;
  final description;
  final stock;
  final supplier;

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: Container(
        width: widget.width,
        height: 32,
        //color: Colors.green,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        alignment: Alignment.center,
        child: Text('${widget.columnTitle}',
            style: const TextStyle(color: Color(0xFF313133))),
      ),
    );
  }
}

//Row containing Data Blocks. Displays a detail view of the search results.
class ItemView extends StatefulWidget {
  const ItemView(
      {Key? key,
      this.columnTitle,
      this.width,
      this.prefixText,
      this.labelText,
      this.icon,
      this.itemCode,
      this.itemTitle,
      this.description,
      this.stock,
      this.supplier})
      : super(key: key);

  final columnTitle;
  final width;
  final prefixText;
  final labelText;
  final icon;
  final itemCode;
  final itemTitle;
  final description;
  final stock;
  final supplier;

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DataBlock(
          columnTitle: widget.itemCode,
          width: 128,
          labelText: 'Item Code',
          prefixText: '#',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.itemTitle,
          width: 196,
          labelText: 'Item Title',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.description,
          width: 256,
          labelText: 'Description',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.stock,
          width: 128,
          labelText: 'Stock',
          prefixText: '#',
          icon: const Icon(Icons.search),
        ),
        DataBlock(
          columnTitle: widget.supplier,
          width: 128,
          labelText: 'Supplier',
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

*/
