import 'package:chatbox/Services/store_services.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "New Messages".text.make(),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: StreamBuilder(
            stream: StoreServices.getAllUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                  var doc = snapshot.data.doc[index];
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: "${doc['name']}".text.make(),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
