import 'package:flutter/material.dart';
import 'package:my_tarot/features/detail/ui/widget/note_tarot_button.dart';
import 'package:my_tarot/features/shared/widgets/tarot_card_detail.dart';
import 'package:my_tarot/models/tarot.dart';

class DetailPage extends StatelessWidget {
  final Tarot tarot;

  const DetailPage({Key key, this.tarot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tarot.name),
      ),
      body: TarotCardDetail(
        tarot: tarot,
      ),
      floatingActionButton: NoteTarotButton(),
    );
  }
}
