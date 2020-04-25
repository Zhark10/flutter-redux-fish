import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'state.dart';

Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('ToDoList'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(PageActionCreator.onAddAction()),
      child: const Icon(Icons.add),
      tooltip: 'Add',
      backgroundColor: state.themeColor,
    ),
    bottomNavigationBar: BottomAppBar(
      notchMargin: 5,
      shape: CircularNotchedRectangle(),
      color: state.themeColor,
      child: Container(height: 50.0)
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    body: Container(
      child: Column(
        children: <Widget>[
          viewService.buildComponent('report'),
          Expanded(
              child: ListView.builder(
                  itemBuilder: adapter.itemBuilder,
                  itemCount: adapter.itemCount))
        ],
      ),
    ),
  );
}
