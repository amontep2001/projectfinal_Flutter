import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/item_service.dart';

class EditItemScreen extends StatefulWidget {
  late String documentid;
  final _itemName = TextEditingController();
  final _itemDesc = TextEditingController();
  EditItemScreen(String documentid, String itemname, String itemdesc) {
    documentid = documentid;
    _itemName.text = itemname;
    _itemDesc.text = itemdesc;
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final ItemService _itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: widget._itemName,
              decoration: const InputDecoration(label: Text("Item name")),
              readOnly: true,
            ),
            TextField(
              controller: widget._itemDesc,
              decoration:
                  const InputDecoration(label: Text("Item Description")),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: _deleteItem, child: const Text("Delete")),
            ),
            ElevatedButton(onPressed: _editItem, child: const Text("Edit"))
          ],
        ),
      ),
    );
  }

  void _editItem() {
    _itemService.editItem(widget._itemName.text,
        {"name": widget._itemName.text, "desc": widget._itemDesc.text});
  }

  void _deleteItem() {
    _itemService.deleteItem(widget._itemName.text);
  }
}