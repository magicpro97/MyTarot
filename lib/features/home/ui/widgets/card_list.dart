import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/home/ui/bloc/bloc.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card.dart';
import 'package:provider/provider.dart';

class CardList extends StatelessWidget {
  static const String _TAG = "CardList";

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBloc>(context);

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final ratio = itemWidth / itemHeight;

    return Container(
      child: BlocBuilder(
        bloc: homeBloc,
        builder: (BuildContext context, HomeState state) =>
            StreamBuilder<List<TarotCard>>(
                stream: homeBloc.tarotCardListStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LinearProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  log("Resolution ratio: $ratio", name: _TAG);
                  final tarotCards = snapshot.data;
                  return OrientationBuilder(
                    builder: (context, orientation) =>
                        GridView.count(
                          childAspectRatio: ratio < 0.6
                              ? 0.7
                              : ratio < 0.635 ? 0.6 : ratio < 0.639
                              ? 0.6
                              : 0.55,
                          shrinkWrap: true,
                          crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                          children: tarotCards,
                        ),
                  );
                }),
      ),
    );
  }
}
