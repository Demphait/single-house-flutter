import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class SocketIO {
  static late IO.Socket _socketIO;

  static String? get id => _socketIO.id;
  static bool get connected => _socketIO.connected;

  static Future<void> init({
    required String domain,
  }) async {
    _socketIO = IO.io(
      domain,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setReconnectionDelay(10)
          .setReconnectionDelayMax(10)
          .enableReconnection()
          .build(),
    );
    _socketIO.on('connect', (_) => log('connect: ${_socketIO.id}'));
    _socketIO.on('disconnect', (_) => log('disconnect'));
    _socketIO.connect();
  }

  static void bind(String event, void Function(dynamic data) handler) {
    _socketIO.on(event, handler);
  }

  static void unbind(String event, [void Function(dynamic data)? handler]) {
    _socketIO.off(event, handler);
  }

  static void send(String event, Map<String, dynamic> data) {
    _socketIO.emit(event, data);
  }
}
