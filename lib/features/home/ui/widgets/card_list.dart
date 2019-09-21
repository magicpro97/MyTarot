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
    final ratio = itemWidth / itemHeight;

    return Container(
      child: BlocBuilder(
        bloc: homeBloc,
        builder: (BuildContext context, HomeState state) =>
            StreamBuilder<
                List<TarotCard>>(
                stream: homeBloc.tarotListStream.transform(
                    tarotCardListTransform),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    if (state is InitialHomeBlocState) {
                      homeBloc.dispatch(InitDataEvent());
                      return LinearProgressIndicator();
                    }
                    return Center(
                      child: Text(
                          "Can't load data. Please check internet connection."),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  final tarotCards = snapshot.data;
                  return OrientationBuilder(
                    builder: (context, orientation) =>
                        GridView.count(
                          childAspectRatio:
                          ratio < 0.635 ? 0.7 : ratio < 0.639 ? 0.6 : 0.55,
                          shrinkWrap: true,
                          crossAxisCount: orientation == Orientation.portrait
                              ? 2
                              : 4,
                          children: tarotCards,
                        ),
                  );
                }),
      ),
    );
  }
}
