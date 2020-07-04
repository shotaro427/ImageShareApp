import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/widgets/top_image_list/add_tag_page.dart';

class SelectTagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("タグ"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTagPage(),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.fromLTRB(2, 5, 2, 0),
              padding: const EdgeInsets.all(8),
              child: Text(
                items[index],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: hexToColor(_tagBgColors[index]),
              ),
            ),
            onTap: () {},
          );
        },
        itemCount: items.length,
      ),
    );
  }

  final items = ['タグ1', 'タグ2', 'タグ3', 'タグ4', 'タグ5'];

  final _tagBgColors = [
    '#ff7f7f',
    '#ff7fbf',
    '#ff7fff',
    '#bf7fff',
    '#7f7fff',
    '#7fbfff',
    '#7fffff',
    '#7fffbf',
    '#7fff7f',
    '#bfff7f',
    '#ffff7f',
    '#ffbf7f'
  ];

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
