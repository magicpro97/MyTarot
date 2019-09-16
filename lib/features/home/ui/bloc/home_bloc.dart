import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/utils/network_utils.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final localDb = GetIt.I<MoorDb>();

  @override
  HomeState get initialState => InitialHomeBlocState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is CheckingNetworkEvent) {
      if (await NetworkUtils.isConnect()) {
        yield NetworkConnectedState();
      } else {
        //final tarotDao = localDb.tarotDao;
        yield NetworkDisconnectedState();
      }
    }
  }
}
