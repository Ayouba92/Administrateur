
import 'dart:convert';
import 'package:admin/Drawer/GestionListe.dart';
import 'package:admin/Drawer/GestionResultat.dart';
import 'package:admin/Drawer/InfosConcour.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class PageAcceuil extends StatelessWidget {
  const PageAcceuil({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(title: Text("Nom  Prénom"),),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header du Drawer
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("Assets/oum.jpg"), // Image de profil
                    ),
                    SizedBox(height: 10),
                    Text("vieux maiga",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("email@example.com",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
              //liste des options
              InkWell(
                splashColor: Colors.deepOrange,
                onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context){
                        return PageAcceuil();
                      })
                      );
                  },
                child: const ListTile(
                  leading: Icon(Icons.home, color:  Colors.orange),
                  title: Text("Accueil"),
                  
                ),
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                onTap: () {
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context){
                        return const Infos();
                      })
                      );
                },
                child: const ListTile(
                  leading: Icon(Icons.notifications, color:  Colors.orange),
                  title: Text("Infos Concours"),
                  
                ),
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context){
                        return const Resultat();
                      })
                      );
                  },
                child: const ListTile(
                  leading: Icon(Icons.settings, color:  Colors.orange),
                  title: Text("Gestion de Résultats"),
                  
                ),
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Listes();
                    }));
                  },
                child: const ListTile(
                  leading: Icon(Icons.help, color:  Colors.orange),
                  title: Text("Gestion des Listes"),
                  
                ),
              ),
            ]
        ),
      ),

      body:Scaffold(),// ListView.builder(itemBuilder: itemBuilder),
    );
  }
}