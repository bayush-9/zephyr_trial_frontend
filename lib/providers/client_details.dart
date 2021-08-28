import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Client {
  String name;
  String id;
  String company;
  String orderId;
  double invoicepaid;
  double invoicePending;

  Client({
    this.name,
    this.id,
    this.company,
    this.orderId,
    this.invoicePending,
    this.invoicepaid,
  });
}

class Clients with ChangeNotifier {
  List<Client> _clients = [];

  List<Client> get clients {
    return [..._clients];
  }

  Future<void> fetchclients() async {
    final url = Uri.parse(
        'https://run.mocky.io/v3/d53400a3-6126-495e-9d16-0b4414b537b3');
    final response = await http.get(url);
    if (json.decode(response.body + '}') == null) {
      return;
    }

    List<Client> loadedClient = [];

    final instance = json.decode(response.body + '}')['clients'];
    for (int i = 0; i < instance.length; i++) {
      loadedClient.add(
        new Client(
          company: instance[i]['company'],
          id: (instance[i]['id']),
          invoicePending: double.tryParse(instance[i]['invoicePending']),
          invoicepaid: double.tryParse(instance[i]['invoicepaid']),
          name: instance[i]['name'],
          orderId: instance[i]['orderId'],
        ),
      );
    }

    _clients = loadedClient;
    notifyListeners();
  }
}
