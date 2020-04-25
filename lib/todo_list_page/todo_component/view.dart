import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;

import 'action.dart';
import 'state.dart';

Widget buildView(
  ToDoState state,
  Dispatch dispatch,
  ViewService viewService,
) {
  return Container(
    color: Color.fromRGBO(235, 235, 235, 0.2),
    margin: EdgeInsets.all(2),
      child: ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      state.title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: <Widget>[
        // Expanded(
        //     flex: 1,
        //     child: Container(
        //       child: LinearProgressIndicator(
        //           backgroundColor: Color.fromRGBO(235, 235, 235, 0.5),
        //           value: 0.6,
        //           valueColor: AlwaysStoppedAnimation(Colors.green)),
        //     )),
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(0),
              child: Text(state.desc,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        )
      ],
    ),
    trailing: Icon(Icons.edit_attributes, color: Colors.white, size: 30.0),
    onTap: () {
      dispatch(ToDoActionCreator.onEditAction(state.uniqueId));
    },
  ));
}
