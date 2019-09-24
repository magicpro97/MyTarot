import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tarot/features/home/ui/home_page.dart';

import './bloc.dart';

class SlashBloc extends Bloc<SlashEvent, SlashState> {
  static const _TAG = "SlashBloc";

  @override
  SlashState get initialState => InitialSlashState();

  @override
  Stream<SlashState> mapEventToState(
    SlashEvent event,
  ) async* {
    if (event is LoadingEvent) {
      await Future.delayed(Duration(seconds: 5));
      Navigator.pushReplacement(
          event.context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
