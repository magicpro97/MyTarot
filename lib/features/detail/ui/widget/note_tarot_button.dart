import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/data/models/tarot.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:provider/provider.dart';

import 'note_sheet.dart';

class NoteTarotButton extends StatelessWidget {
  final Tarot tarot;

  const NoteTarotButton({
    Key key,
    this.tarot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailBloc = Provider.of<DetailBloc>(context);

    Future<bool> _onWillPop() async {
      detailBloc.dispatch(CloseNote(save: false));
      Navigator.pop(context);
      return false;
    }

    return BlocBuilder(
      bloc: detailBloc,
      builder: (context, state) =>
          StreamBuilder<bool>(
              stream: detailBloc.sheetStateStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return FloatingActionButton(
                  child: snapshot.data
                      ? state is LoadingState
                      ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                      : Icon(Icons.save)
                      : Icon(Icons.note),
                  tooltip: snapshot.data ? "Save" : "Open",
                  onPressed: () {
                    if (detailBloc.isSheetOpen) {
                      detailBloc.dispatch(CloseNote(save: true));
                    } else {
                      final bottomSheetController = showBottomSheet(
                        context: context,
                        builder: (context) =>
                            WillPopScope(
                              child: NoteSheet(),
                              onWillPop: _onWillPop,
                            ),
                      );
                      detailBloc.dispatch(
                          OpenNote(bottomSheetController, tarot));
                    }
                  },
                );
              }),
    );
  }
}
