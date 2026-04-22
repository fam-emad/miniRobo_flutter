import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  WebSocketChannel? _channel;
  bool isConnected = false;
  Stream get messageStream => _channel!.stream;

  void connect(String url) {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      isConnected = true;
      print('Connected to WebSocket at $url');
    } catch (e) {
      isConnected = false;
      print('Error connecting to WebSocket: $e');
    }
  }

  void sendCommand(String command) {
    if (isConnected && _channel != null) {
      _channel!.sink.add(command);
      print('Sent command: $command');
    } else {
      print('Cannot send command, not connected to WebSocket.');
    }
  }

  void disconnect() {
    if (isConnected && _channel != null) {
      _channel!.sink.close();
      isConnected = false;
      print('Disconnected from WebSocket.');
    } else {
      print('Cannot disconnect, not connected to WebSocket.');
    }
  }
}
