import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zypher_frontend/providers/client_details.dart';
import 'package:zypher_frontend/screens/clients_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Clients(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ClientsDetailsScreen(),
      ),
    );
  }
}
