import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketHelper {
  late IOWebSocketChannel channel;
  late Map<String, dynamic> subscriptions;
  void Function(dynamic)? onData;
  void Function()? onDone;
  Function(dynamic)? onError;
  void initChannel(String url) {
    channel = IOWebSocketChannel.connect(Uri.parse(url));
    channel.ready
        .then((_) {
          channel.stream.listen(
            onData,
            onDone: onDone,
            onError: (error) => onError?.call(error),
            cancelOnError: true,
          );
          channel.sink.add(jsonEncode(subscriptions));
        })
        .catchError((error) {
          debugPrint('WebSocket connection error: $error');
          closeChannel();
        });
  }

  void closeChannel() {
    channel.sink.close();
  }
}
