import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_tarot/features/slash/bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';

class SlashPage extends StatelessWidget {
  final String logoUrl;

  const SlashPage({Key key, this.logoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slashBloc = SlashBloc();
    slashBloc.dispatch(LoadingEvent(context));

    return BlocBuilder<SlashBloc, SlashState>(
        bloc: slashBloc,
        builder: (context, state) => Scaffold(
              appBar: PreferredSize(
                  child: Container(),
                  preferredSize: Size.fromHeight(kToolbarHeight)),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "My Tarot",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 96.0),
                    child: SvgPicture.asset(
                      logoUrl,
                      semanticsLabel: "Tarot",
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Shimmer.fromColors(
                    child: Text(
                      "Loading...",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                  ),
                  LinearProgressIndicator(),
                ],
              ),
            ));
  }
}
