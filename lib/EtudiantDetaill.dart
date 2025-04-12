import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentDetails extends StatefulWidget {
  final Map student;

  const StudentDetails({super.key, required this.student});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  bool isLoading = false;

  // Fonction pour valider l'étudiant
  Future<void> validateStudent() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse("http://192.168.1.14:5000/validate_student"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"id_user": widget.student['id_user']}),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Étudiant validé avec succès !")),
      );
      Navigator.pop(context); // Retour à la liste après validation
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Échec de la validation")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  // Fonction pour rejeter l'étudiant
  Future<void> rejectStudent() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse("http://192.168.1.14:5000/reject_student"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"id_user": widget.student['id_user']}),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Étudiant rejeté avec succès !")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Échec du rejet")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.student['nomcomplet'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nom: ${widget.student['nomcomplet']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text("Email: ${widget.student['email']}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text("Téléphone: ${widget.student['telephone']}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: isLoading ? null : validateStudent,
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text("Valider"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton.icon(
                  onPressed: isLoading ? null : rejectStudent,
                  icon: const Icon(Icons.cancel, color: Colors.white),
                  label: const Text("Rejeter"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
