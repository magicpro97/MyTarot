import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';
import 'package:my_tarot/models/tarot.dart';

import 'note_sheet.dart';

class NoteTarotButton extends StatelessWidget {
  final Tarot tarot;

  const NoteTarotButton({
    Key key,
    this.tarot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailBloc = GetIt.I<DetailBloc>();

    Future<bool> _onWillPop() async {
      detailBloc.dispatch(CloseNote(save: false));
      Navigator.pop(context);
      return false;
    }

    return BlocBuilder(
      bloc: detailBloc,
      builder: (context, state) => StreamBuilder<bool>(
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
                  detailBloc.dispatch(OpenNote(bottomSheetController, tarot));
                }
              },
            );
          }),
    );
  }
}
