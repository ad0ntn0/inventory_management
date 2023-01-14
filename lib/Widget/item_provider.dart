import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {

  final List<Map<String, dynamic>> _allItems = [
    {
      'Index': 123456789,
      'Item title': 'Blue widget',
      'Description': 'Small, blue widget for organization',
      'Stock': 17,
      'Supplier': 'WidgetWorks'
    },
    {
      'Index': 234567890,
      'Item title': 'Red gizmo',
      'Description': 'Compact, red gadget for entertainment',
      'Stock': 25,
      'Supplier': 'GizmoCorp'
    },
    {
      'Index': 345678901,
      'Item title': 'Yellow thingamajig',
      'Description': 'Bright, yellow tool for decoration',
      'Stock': 8,
      'Supplier': 'ThingamajigCo'
    },
    {
      'Index': 456789012,
      'Item title': 'Green doohickey',
      'Description': 'Large, green device for outdoor use',
      'Stock': 14,
      'Supplier': 'DoohickeyInc'
    },
    {
      'Index': 567890123,
      'Item title': 'Purple whatchamacallit',
      'Description': 'Elegant, purple gadget for special occasions',
      'Stock': 6,
      'Supplier': 'WhatchamacallitLtd'
    },
    {
      'Index': '678901234',
      'Item title': 'Orange thingamabob',
      'Description': 'Durable, orange tool for heavy duty tasks',
      'Stock': 20,
      'Supplier': 'ThingamabobCo'
    },
    {
      'Index': 789012345,
      'Item title': 'Black doodad',
      'Description': 'Sleek, black device for everyday use',
      'Stock': 10,
      'Supplier': 'DoodadLLC'
    },
    {
      'Index': 890123456,
      'Item title': 'White widget',
      'Description':
      'Pure, white widget for cleanlinessPure, white widget for cleanlinessPure, white widget for cleanlinessPure, white widget for cleanlinessPure, white widget for cleanliness',
      'Stock': 22,
      'Supplier': 'WidgetInc'
    },
    {
      'Index': 901234567,
      'Item title': 'Brown gizmo',
      'Description': 'Rustic, brown gadget for a vintage look',
      'Stock': 16,
      'Supplier': 'GizmoCo'
    },
    {
      'Index': 012345678,
      'Item title': 'Pink thingamajig',
      'Description': 'Soft, pink tool for a feminine touch',
      'Stock': 4,
      'Supplier': 'ThingamajigLtd'
    },
  ];

  List<Map<String, dynamic>> get allItems => _allItems;
}