import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/repositories/local/moor_db.dart';
import 'package:my_tarot/data/tranformers/tarot_tranformer.dart';
import 'package:my_tarot/models/tarot.dart';
import 'package:my_tarot/utils/network_utils.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with TarotTransformer {
  final localDb = GetIt.I<MoorDb>();

  final _tarotListController = BehaviorSubject<List<Tarot>>();

  Stream<List<Tarot>> get tarotListStream => _tarotListController.stream;

  List<Tarot> get tarotList => _tarotListController.value;

  Function get updateTarotList => _tarotListController.add;

  @override
  HomeState get initialState => InitialHomeBlocState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    print(event.toString());
    if (event is InitDataEvent) {
      if (await NetworkUtils.isConnect()) {
        await _initData();
        yield LoadedState();
      } else {
        yield LoadFailState();
      }
    }
  }

  @override
  void dispose() {
    _tarotListController.close();
    super.dispose();
  }

  Future<void> _initData() async {
    await Firestore.instance
        .collection('tarot')
        .orderBy('name')
        .snapshots()
        .transform(tarotListTransform)
        .pipe(_tarotListController);
//        .transform(tarotTblDataTransform)
//        .listen((data) async => await localDb.tarotDao.insertTarots(data));
  }
}
