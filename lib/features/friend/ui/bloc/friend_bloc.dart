import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:my_tarot/data/models/message.dart';
//import 'package:permission_handler/permission_handler.dart';

import './bloc.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  static const String _TAG = "FriendBloc";

  List<Message> messages = [
    Message(
        id: 'aaa',
        userId: 'aa',
        content: 'ádasdasdasdas',
        type: MessageType.TEXT,
        status: MessageStatus.SENT,
        createdDate: DateTime.now())
  ];

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
      messages.add(event.message);

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
