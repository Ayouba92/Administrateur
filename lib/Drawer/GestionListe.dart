import 'package:admin/Drawer/GestionResultat.dart';
import 'package:flutter/material.dart';

class Listes extends StatelessWidget {
  const Listes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Listes",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold)),
        ),
        backgroundColor:Colors.deepOrange,
      ),
      body: FileImportWidget()
    );
  }
}