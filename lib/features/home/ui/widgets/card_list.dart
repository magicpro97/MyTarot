import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/data/tranformers/tarot_tranformer.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';

class CardList extends StatelessWidget with TarotTransformer {
  @override
  Widget build(BuildContext context) {
    final homeBloc = GetIt.I<HomeBloc>();

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Container(
      child: BlocBuilder(
        bloc: homeBloc,
        builder: (BuildContext context, HomeState state) =>
            StreamBuilder<List<TarotCard>>(
                stream:
                homeBloc.tarotListStream.transform(tarotCardListTransform),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    if (state is InitialHomeBlocState) {
                      homeBloc.dispatch(InitDataEvent());
                    }
                    return LinearProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  final tarotCards = snapshot.data;

                  return GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: tarotCards,
                  );
                }),
      ),
    );
  }
}
