import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  TagList(this._tags);
  final List<String> _tags;

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _tags == null || _tags.length < 1;

    return isEmpty
        ? SizedBox(
            height: 28,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          child: Text(
                            _tags[index],
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  );
                },
                itemCount: _tags.length),
          )
        : const SizedBox.shrink();
  }
}
