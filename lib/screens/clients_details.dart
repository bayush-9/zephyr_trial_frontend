import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zypher_frontend/providers/client_details.dart';

class ClientsDetailsScreen extends StatefulWidget {
  @override
  _ClientsDetailsScreenState createState() => _ClientsDetailsScreenState();
}

class _ClientsDetailsScreenState extends State<ClientsDetailsScreen> {
  bool _isloading = true;
  @override
  void initState() {
    callFirst();
    super.initState();
  }

  void callFirst() async {
    await Provider.of<Clients>(context, listen: false).fetchclients();
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListExamples'),
      ),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                final fetchedClient =
                    Provider.of<Clients>(context, listen: false).clients;
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('Id:' + fetchedClient[index].id),
                  ),
                  title: Text(
                    fetchedClient[index].name +
                        ' (Order Id: ' +
                        fetchedClient[index].orderId +
                        ')  Pending:' +
                        fetchedClient[index].invoicePending.toString(),
                  ),
                  subtitle: Text(
                    fetchedClient[index].company +
                        '   Invoice Paid:' +
                        fetchedClient[index].invoicepaid.toString(),
                  ),
                );
              },
              itemCount:
                  Provider.of<Clients>(context, listen: false).clients.length,
            ),
    );
  }
}
