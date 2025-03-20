import 'package:admin/Acceuil.dart';
import 'package:admin/Connexion.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(Page1());
}
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:connexion(),
      // PageAcceuil(),
    );
  }
}
