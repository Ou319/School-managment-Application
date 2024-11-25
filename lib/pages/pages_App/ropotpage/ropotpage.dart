import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';

void main() => runApp(const Ropotpage());

class Ropotpage extends StatelessWidget {
  const Ropotpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/674470f02480f5b4f5a393f9/1idhlib8n',
          visitor: TawkVisitor(
            name: 'USER OFPPT',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}