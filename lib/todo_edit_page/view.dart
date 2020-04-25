import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'state.dart';

Widget buildView(
    TodoEditState state, Dispatch dispatch, ViewService viewService) {
  const light = Color.fromRGBO(235, 235, 235, 0.5);
  return Scaffold(
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.8),
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('Todo'),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () {
                dispatch(ToDoEditActionCreator.onChangeTheme());
              }),
        ),
      ],
    ),
    body: Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: const Text('Title:',
                      style: TextStyle(color: light, fontSize: 20.0)),
                  width: 56.0,
                  alignment: AlignmentDirectional.topEnd,
                ),
                Expanded(
                    child: Container(
                  color: light,
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new TextFormField(
                      controller: state.nameEditController,
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                ))
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 32.0),
            alignment: AlignmentDirectional.topStart,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: const Text('Desc:',
                      style: TextStyle(color: light, fontSize: 20.0)),
                  width: 56.0,
                  alignment: AlignmentDirectional.topEnd,
                ),
                Expanded(
                    child: Container(
                  color: light,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(left: 8.0),
                  child: EditableText(
                      controller: state.descEditController,
                      backgroundCursorColor: light,
                      maxLines: 10,
                      focusNode: state.focusNodeDesc,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16.0),
                      cursorColor: Colors.yellow),
                ))
              ],
            ),
          ))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(ToDoEditActionCreator.onDone()),
      child: const Icon(Icons.done),
      tooltip: 'Done',
      backgroundColor: state.themeColor,
    ),
    bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: state.themeColor,
        child: Container(
          height: 50.0,
        )),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );
}
