import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/detail/ui/bloc/bloc.dart';

class NoteTarotButton extends StatelessWidget {
  const NoteTarotButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.title;
    final textFocusNote = FocusNode();
    final detailBloc = DetailBloc();

    return BlocBuilder(
      bloc: detailBloc,
      builder: (context, state) => FloatingActionButton(
        child: detailBloc.isNoteOpen ? Icon(Icons.close) : Icon(Icons.note),
        onPressed: () {
          var bottomSheetController = showBottomSheet(
              context: context,
              builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32.0)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 16.0, bottom: 8.0),
                          child: Text(
                            "Say your thinking about the card:",
                            style: titleStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            focusNode: textFocusNote,
                            minLines: 3,
                            maxLines: 5,
                          ),
                        )
                      ],
                    ),
                  ));
          void closeNote() {
            detailBloc.dispatch(CloseNote());
            bottomSheetController.close();
          }

          if (detailBloc.isNoteOpen)
            closeNote();
          else
            detailBloc.dispatch(OpenNote());
        },
      ),
    );
  }
}
