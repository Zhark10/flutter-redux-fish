import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'list_adapter/action.dart' as list_action;
import 'state.dart';
import 'todo_component/component.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Post for example',
      desc: 'I don`t know i should write here',
      isDone: true,
    ),
  ];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: null)
      .then((dynamic toDo) {
    if (toDo != null &&
        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
      ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
    }
  });
}
