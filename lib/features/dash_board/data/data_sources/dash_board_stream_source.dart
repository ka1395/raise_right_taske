import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../models/ticker_model.dart';

enum WsConnectionStatus { connecting, connected, disconnected, reconnecting }

class CryptoWsEvent {
  final String type;
  final Map<String, dynamic> data;

  CryptoWsEvent({required this.type, required this.data});
}

class CryptoWsService {
  final _wsUrl = 'wss://ws.okx.com:8443/ws/v5/public';
  late IOWebSocketChannel _channel;
  // Timer? _pingTimer;
  Timer? _reconnectTimer;
  bool _manuallyClosed = false;

  final _eventController = StreamController<CryptoWsEvent>.broadcast();
  final _connectionStatusController =
      StreamController<WsConnectionStatus>.broadcast();

  Stream<CryptoWsEvent> get events => _eventController.stream;
  Stream<WsConnectionStatus> get connectionStatus =>
      _connectionStatusController.stream;

  final _subscriptions = {
    'op': 'subscribe',
    'args': TickerModel.requiredCoins.map((symbol) {
      return {'channel': 'tickers', 'instId': symbol};
    }).toList(),
  };

  void connect() {
    _manuallyClosed = false;
    _connectionStatusController.add(WsConnectionStatus.connecting);
    _channel = IOWebSocketChannel.connect(Uri.parse(_wsUrl));
    _channel.ready
        .then((_) {
          _channel.stream.listen(
            _onMessage,
            onDone: _onDisconnected,
            onError: (error) => _onDisconnected(),
          );

          _channel.sink.add(jsonEncode(_subscriptions));

          // _startPing();
          _connectionStatusController.add(WsConnectionStatus.connected);
        })
        .catchError((error) {
          _connectionStatusController.add(WsConnectionStatus.disconnected);
          print('WebSocket connection error: $error');
        });
  }

  void _onMessage(dynamic message) {
    final decoded = jsonDecode(message);

    if (decoded is Map && decoded.containsKey('event')) {
      // Handle subscription ack or error events if needed
      return;
    }

    if (decoded['arg'] == null || decoded['data'] == null) return;

    final channel = decoded['arg']['channel'];
    final instId = decoded['arg']['instId'] ?? "";
    if (channel == 'tickers') {}
    _eventController.add(
      CryptoWsEvent(
        type: 'price_update',
        data: {
          "symbol": instId,
          "last": decoded['data'][0]['last'],
          "vol24h": decoded['data'][0]['vol24h'],
        },
      ),
    );
  }

  void _onDisconnected() {
    _connectionStatusController.add(WsConnectionStatus.disconnected);
    // _stopPing();

    if (!_manuallyClosed) {
      _reconnect();
    }
  }

  void _reconnect() {
    _connectionStatusController.add(WsConnectionStatus.reconnecting);

    connect();
  }

  // void _startPing() {
  //   _pingTimer?.cancel();
  //   _pingTimer = Timer.periodic(const Duration(seconds: 25), (_) {
  //     _channel.sink.add('ping');
  //   });
  // }

  // void _stopPing() {
  //   _pingTimer?.cancel();
  //   _pingTimer = null;
  // }

  void disconnect() {
    _manuallyClosed = true;
    // _stopPing();
    _channel.sink.close(status.goingAway);
    _eventController.close();
    _connectionStatusController.close();
  }

  void dispose() {
    disconnect();
    // _reconnectTimer?.cancel();
  }
}
