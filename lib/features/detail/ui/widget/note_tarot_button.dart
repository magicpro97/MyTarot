import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';

class NoteTarotButton extends StatelessWidget {
  const NoteTarotButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailBloc = GetIt.I<DetailBloc>();

    return BlocBuilder(
      bloc: detailBloc,
      builder: (context, state) => StreamBuilder<bool>(
          stream: detailBloc.sheetStateStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return FloatingActionButton(
              child: snapshot.data ? Icon(Icons.save) : Icon(Icons.note),
              tooltip: snapshot.data ? "Save" : "Open",
              onPressed: () {
                if (detailBloc.isSheetOpen) {
                  detailBloc.dispatch(CloseNote());
                } else {
                  final bottomSheetController = showBottomSheet(
                      context: context, builder: (context) => NoteSheet());
                  detailBloc.dispatch(OpenNote(bottomSheetController));
                }
              },
            );
          }),
    );
  }
}

class NoteSheet extends StatelessWidget {
  const NoteSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailBloc = GetIt.I<DetailBloc>();
    final titleStyle = Theme.of(context).textTheme.title;
    final textFocusNote = FocusNode();

    return BlocBuilder(
      bloc: detailBloc,
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 24.0, bottom: 8.0),
              child: Text(
                "Say your thinking about the card:",
                style: titleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: detailBloc.content,
                decoration: InputDecoration(hintText: "Type something here..."),
                focusNode: textFocusNote,
                minLines: 3,
                maxLines: 6,
                onChanged: (value) => detailBloc.updateNote(value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
