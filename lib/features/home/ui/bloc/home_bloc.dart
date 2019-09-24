import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/data/repositories/remote/firestore_db.dart';
import 'package:my_tarot/data/tranformers/tarot_tranformer.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with TarotTransformer {
  final remoteDb = GetIt.I<FirestoreDb>();

  final _tarotListController = BehaviorSubject<List<Tarot>>();

  Stream<List<Tarot>> get tarotListStream => _tarotListController.stream;

  List<Tarot> get tarotList => _tarotListController.value;

  Function get updateTarotList => _tarotListController.add;

  Stream<List<TarotCard>> get tarotCardListStream =>
      tarotListStream.transform(toTarotCardList);

  HomeBloc() {
    _tarotListController.sink.addStream(remoteDb.tarotDao.tarotListStream);
  }

  @override
  HomeState get initialState => InitialHomeBlocState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,) async* {}

  @override
  void dispose() {
    _tarotListController.close();
    super.dispose();
  }
}
