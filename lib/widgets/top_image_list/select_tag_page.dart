import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_share_app/widgets/top_image_list/add_tag_page.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'select_tag_page.freezed.dart';
part 'select_tag_page.g.dart';

@freezed
abstract class TagState with _$TagState {
  const factory TagState(
      {@Default('') String tagName,
      @Default(false) bool isSelected,
      @Default('#ffffff') String hexColor}) = _TagState;

  factory TagState.fromJson(Map<String, dynamic> json) =>
      _$TagStateFromJson(json);
}

@freezed
abstract class SelectTagState with _$SelectTagState {
  const factory SelectTagState({
    @Default([]) List<TagState> tags,
  }) = _SelectTagState;
}

class SelectTagStateController extends StateNotifier<SelectTagState> {
  SelectTagStateController()
      : super(const SelectTagState(
          tags: [
            TagState(tagName: 'タグ1', hexColor: '#ff7f7f'),
            TagState(tagName: 'タグ2', hexColor: '#ff7fbf'),
            TagState(tagName: 'タグ3', hexColor: '#ff7fff'),
            TagState(tagName: 'タグ4', hexColor: '#bf7fff'),
            TagState(tagName: 'タグ5', hexColor: '#7f7fff'),
            TagState(tagName: 'タグ6', hexColor: '#7fbfff'),
            TagState(tagName: 'タグ7', hexColor: '#7fffff'),
            TagState(tagName: 'タグ8', hexColor: '#7fffbf'),
            TagState(tagName: 'タグ9', hexColor: '#bfff7f'),
          ],
        ));

  void switchIsSelected(int index) {
    List<TagState> tags = List.from(state.tags);
    tags[index] =
        state.tags[index].copyWith(isSelected: !state.tags[index].isSelected);

    state = state.copyWith(tags: tags);
  }
}

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
      body: Builder(builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) => _TagItem(index),
          itemCount: Provider.of<SelectTagState>(context).tags.length,
        );
      }),
    );
  }
}

class _TagItem extends StatelessWidget {
  final int index;

  _TagItem(this.index);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<SelectTagState>(
      stateNotifier:
          Provider.of<SelectTagStateController>(context, listen: false),
      builder: (context, state, _) {
        return GestureDetector(
          child: Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(2, 5, 2, 0),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.tags[index].tagName,
                ),
                Visibility(
                  visible: state.tags[index].isSelected,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: _hexToColor(state.tags[index].hexColor)
                  .withOpacity(state.tags[index].isSelected ? 1 : 0.5),
            ),
          ),
          onTap: () =>
              Provider.of<SelectTagStateController>(context, listen: false)
                  .switchIsSelected(index),
        );
      },
    );
  }

  Color _hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
