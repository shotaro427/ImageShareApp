import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:image_share_app/widgets/top_image_list/add_tag_page.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'select_tag_page.freezed.dart';

@freezed
abstract class TagState with _$TagState {
  const factory TagState({
    @Default('') String tagName,
    @Default(false) bool isSelected,
  }) = _TagState;
}

@freezed
abstract class SelectTagState with _$SelectTagState {
  const factory SelectTagState({
    @Default([]) List<TagState> tags,
  }) = _SelectTagState;
}

class TagStateController extends StateNotifier<TagState> {
  TagStateController() : super(const TagState());

  void switchIsSelected() {
    final bool isSelected = !state.isSelected;
    state = state.copyWith(isSelected: isSelected);
  }
}

class SelectTagStateController extends StateNotifier<SelectTagState> {
  SelectTagStateController()
      : super(const SelectTagState(tags: [
          const TagState(tagName: 'タグ1'),
          const TagState(tagName: 'タグ2'),
          const TagState(tagName: 'タグ3'),
          const TagState(tagName: 'タグ4'),
          const TagState(tagName: 'タグ5'),
          const TagState(tagName: 'タグ6'),
          const TagState(tagName: 'タグ7'),
          const TagState(tagName: 'タグ8'),
          const TagState(tagName: 'タグ9'),
        ]));

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
    return StateNotifierProvider<SelectTagStateController, SelectTagState>(
      create: (_) => SelectTagStateController(),
      child: Scaffold(
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
            itemCount: context.watch<SelectTagState>().tags.length,
          );
        }),
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  final int index;

  _TagItem(this.index);

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<SelectTagState>(
      stateNotifier: context.read<SelectTagStateController>(),
      builder: (context, state, _) {
        print('リビルド ${state.tags[index].tagName}');
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
              color: hexToColor(_tagBgColors[index % 11])
                  .withOpacity(state.tags[index].isSelected ? 1 : 0.5),
            ),
          ),
          onTap: () =>
              context.read<SelectTagStateController>().switchIsSelected(index),
        );
      },
    );
  }

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
