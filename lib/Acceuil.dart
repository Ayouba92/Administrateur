import 'dart:convert';
import 'package:admin/Drawer/GestionListe.dart';
import 'package:admin/Drawer/GestionResultat.dart';
import 'package:admin/Drawer/InfosConcour.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'EtudiantDetaill.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  List students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  // Fonction pour récupérer les étudiants
  Future<void> fetchStudents() async {
    final response = await http.get(Uri.parse("http://192.168.0.106:5000/students"));

    if (response.statusCode == 200) {
      setState(() {
        students = json.decode(response.body);
      });
    } else {
      throw Exception("Échec du chargement des étudiants");
    }
  }

  // // Fonction pour valider un étudiant
  // Future<void> validateStudent(int id_user) async {
  //   final response = await http.post(
  //     Uri.parse("http://192.168.0.110:5000/validate_student"),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode({"id_user": id_user}),
  //   );

  //   if (response.statusCode == 200) {
  //     fetchStudents(); // Rafraîchir la liste après validation
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Nom  Prénom Admin"),),
      appBar: AppBar(
        title:const Center(child: Text("Nom  Prénom Admin",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),),
        backgroundColor:Colors.orange,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("Assets/ENI_ABT.png"),
            ),

          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30),
                  SizedBox(height: 10),
                  Text("vieux maiga", style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text("email@example.com", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
              ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.orange),
              title: const Text("Accueil"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PageAcceuil()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.orange),
              title: const Text("Infos Concours"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Infos()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.orange),
              title: const Text("Gestion de Résultats"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Resultat()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.orange),
              title: const Text("Gestion des Listes"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Listes()));
              },
            ),
          ]
      ),
      ),
      body: students.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(student['nomcomplet']),
                    subtitle: Text(student['email']),
                    //
                     onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(student: student),
                        ),
                      );},//
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Ajoute ici la logique pour générer et imprimer le PDF
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.print),
                          onPressed: () {
                            // Ajoute ici la logique pour générer et imprimer le PDF
                          },
                        ),
                        // IconButton(
                        //   icon: const Icon(Icons.check, color: Colors.green),
                        //   onPressed: () {
                        //     validateStudent(student['id_user']);
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
