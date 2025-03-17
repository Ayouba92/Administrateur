import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  return runApp(PageAcceuil());
}

class PageAcceuil extends StatelessWidget {
  const PageAcceuil({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold (
      appBar: AppBar(
        title: Text("Nom  Prénom"),    
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            ElevatedButton(onPressed: (){}, child: Text("Gestion des candidats")),
            ElevatedButton(onPressed: (){}, child: Text("Gestion des resultats")),
            ElevatedButton(onPressed: (){}, child: Text("Gestion des listes")),
            ElevatedButton(onPressed: (){}, child: Text("Infos concours")),

          ],
        ),
      ),
      body:// ListView.builder(itemBuilder: itemBuilder),
      ListView(
       
      )
    )
    );
  }
}