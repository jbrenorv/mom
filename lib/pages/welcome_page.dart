import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom/services/mom/mom_publisher_service.dart';

import '../widgets/application_typy_button_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  late final MomPublisherService _publisherService;
  final _txtCtrl = TextEditingController();

  @override
  void initState() {
    _publisherService = context.read<MomPublisherService>();
    // _publisherService.connect('ws://127.0.0.1:61613');
    _publisherService.connect('127.0.0.1', 1883);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vindo!'),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            splashRadius: 20.0,
            icon: const Icon(
              Icons.wifi,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              
            },
            splashRadius: 20.0,
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32.0,
              ),
              child: Text(
                'Selecione um tipo de aplicação',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ApplicationTypyButtonWidget(
                    onTap: () {
                      
                    },
                    text: 'Sensor',
                  ),
                ),
                Flexible(
                  child: ApplicationTypyButtonWidget(
                    onTap: () {
                      
                    },
                    text: 'Client',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _txtCtrl,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    _publisherService.publish(_txtCtrl.text);
                  },
                  child: const Text('Send'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
