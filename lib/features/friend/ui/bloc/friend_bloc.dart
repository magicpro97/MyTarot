import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:my_tarot/data/models/chat_group.dart';
import 'package:my_tarot/data/models/message.dart';
import 'package:my_tarot/features/auth/auth.dart';

import './bloc.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  static const String _TAG = "FriendBloc";

  int currentGroupIndex = 0;

  fbAuth.FirebaseUser user;

  List<ChatGroup> chatGroup = [
    ChatGroup(
        memIds: <String>[
          '1',
          '2',
        ],
        id: '1',
        messages: <Message>[
          Message(
            userId: '1',
            content: 'hello',
            createdDate: DateTime.now(),
            id: '1',
            type: MessageType.TEXT,
          ),
          Message(
            userId: '2',
            content: 'hi',
            createdDate: DateTime.now(),
            id: '2',
            type: MessageType.TEXT,
          ),
        ],
        createdDate: DateTime.now()),
    ChatGroup(id: '2', createdDate: DateTime.now(), messages: <Message>[
      Message(
        userId: '1',
        content: 'hello',
        createdDate: DateTime.now(),
        id: '1',
        type: MessageType.TEXT,
      ),
      Message(
        userId: '2',
        content: 'hi',
        createdDate: DateTime.now(),
        id: '3',
        type: MessageType.TEXT,
      ),
    ], memIds: <String>[
      '1',
      '3'
    ]),
  ];

  FriendBloc() {
    Auth.userStream.listen((newUser) => user = newUser);
  }

  @override
  FriendState get initialState => InitialFriendState();

  @override
  Stream<FriendState> mapEventToState(
    FriendEvent event,
  ) async* {
    /*if (event is CheckingImageStoragePermission) {
      PermissionStatus permission = await _checkingPermission();
      log(permission.toString(), name: _TAG);
      if (permission == PermissionStatus.denied) {
        await _requestImagePermission();
        PermissionStatus permission = await _checkingPermission();
        if (permission == PermissionStatus.denied) {
          yield PermissionGrantedState();
        } else {
          yield PermissionDeniedState();
        }
      } else {
        yield PermissionGrantedState();
      }
    } else*/
    //if (event is GetImages) {}
    if (event is SentMessage) {
      chatGroup[currentGroupIndex].messages.add(event.message);
    }
  }

/*Future<Map<PermissionGroup, PermissionStatus>>
      _requestImagePermission() async {
    Map<PermissionGroup, PermissionStatus> permissions;
    if (Platform.isIOS) {
      permissions = await PermissionHandler()
          .requestPermissions([PermissionGroup.photos]);
    } else if (Platform.isAndroid) {
      permissions = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
    }
    return permissions;
  }

  Future<PermissionStatus> _checkingPermission() async {
    PermissionStatus permission = PermissionStatus.unknown;

    if (Platform.isIOS) {
      permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.photos);
    } else if (Platform.isAndroid) {
      permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
    }
    return permission;
  }*/
}
