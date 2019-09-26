import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tarot/features/setting/setting_enum.dart';
import 'package:my_tarot/features/setting/ui/bloc/bloc.dart';
import 'package:provider/provider.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingBloc = Provider.of<SettingBloc>(context);

    return BlocBuilder<SettingBloc, SettingState>(
      bloc: settingBloc,
      builder: (context, state) => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sync data with yout account"),
          ),
          Expanded(
            child: Container(),
          ),
          FutureBuilder(
            future: settingBloc.getSetting(Setting.SYNC),
            builder: (context, snapshots) => Switch(
              onChanged: (bool value) =>
                  settingBloc.dispatch(SettingChangeEvent(Setting.SYNC, value)),
              value: snapshots.data ?? false,
            ),
          ),
        ],
      ),
    );
  }
}
