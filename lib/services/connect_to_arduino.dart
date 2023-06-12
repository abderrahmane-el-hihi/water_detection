import 'dart:async';
import 'dart:convert';
import 'dart:io';

class connect_to_server {
  final String serverAddress;
  final int serverPort;
  connect_to_server(this.serverAddress, this.serverPort);
  Future<void> connectToServer(Function(int) onDataReceived) async {
    try {
      final socket = await Socket.connect(serverAddress, serverPort);
      print('Connected to server');

      socket.listen((List<int> data) {
        final numberString = utf8.decode(data);
        final number = int.tryParse(numberString);
        if (number != null) {
          print('Received number: $number');
          onDataReceived(number);
        }
      });
    } catch (error) {
      print('Failed to connect to server: $error');
    }
  }
}
