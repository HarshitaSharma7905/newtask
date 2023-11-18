import 'dart:async';

import 'package:newtaskharshita/Model.dart';

import 'Bloc.dart';







class SearchBloc extends Bloc{
//private streambuilder declear that will manage stream and sink for that bloc
  final userController=StreamController<List<User>>.broadcast();
  @override
  void dispose(){
    userController.close();
  }
}
SearchBloc searchBloc=SearchBloc();