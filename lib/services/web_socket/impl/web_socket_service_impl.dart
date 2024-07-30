// import 'dart:async';
// import 'dart:convert';

// import 'package:stomp_dart_client/stomp_dart_client.dart';

// import '../web_socket_service.dart';

// class WebSocketServiceImpl implements WebSocketService {
//   final String baseUrl;

//   late final List<String> _channelsQueue;
//   late final StreamController<Map<String, dynamic>> streamController;
//   late final StompClient client;

//   @override
//   Stream<Map<String, dynamic>> get stream => streamController.stream;

//   WebSocketServiceImpl({required this.baseUrl}) {
//     _channelsQueue = <String>[];
//     streamController = StreamController.broadcast();
//     client = StompClient(
//       config: StompConfig(
//         url: baseUrl,
//         onConnect: _onConnect,
//       ),
//     );
//   }

//   @override
//   void startClient(String path) {
//     if (client.connected) {
//       client.subscribe(
//         destination: path,
//         callback: _onReceiveData,
//       );
//     } else {
//       _channelsQueue.add(path);
//       client.activate();
//     }
//   }

//   @override
//   void stopClient() {
//     client.deactivate();
//   }

//   void _onConnect(StompFrame frame) {
//     for (var path in _channelsQueue) {
//       startClient(path);
//     }
//   }

//   void _onReceiveData(StompFrame frame) {
//     try {
//       final data = jsonDecode(frame.body!);
//       streamController.add(data);
//     } catch (e) {
//       print('_onReceiveData Error: $e');
//     }
//   }
// }
