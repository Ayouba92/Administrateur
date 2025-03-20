import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  String? message;
  bool isLoading = false; // Indicateur de progression

 //static const String baseUrl = "http://10.0.2.2:5000"; // Adresse du serveur Flask
  static const String baseUrl ="http://127.0.0.1:5000";

  static Future<Map<String, dynamic>> Envoyer(Uint8List fileBytes, String fileName) async {
    var uri = Uri.parse("$baseUrl/upload");

    var request = http.MultipartRequest('POST', uri)
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          fileBytes,
          filename: fileName,
        ),
      );

    var response = await request.send();
    var responseData = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return jsonDecode(responseData);
    } else {
      throw Exception("Erreur d'upload : ${jsonDecode(responseData)['error']}");
    }
  }
  Future<void> selectionEtEnvoi() async {
    setState(() {
      isLoading = true;
      message = null; // Réinitialisation du message
    });

    print("📂 Bouton cliqué : ouverture du sélecteur de fichiers");
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      setState(() {
        isLoading = false;
        message = "❌ Aucun fichier sélectionné";
      });
      return;
    }

    print("✅ Fichier sélectionné : ${result.files.single.name}");

    Uint8List? fileBytes = result.files.single.bytes;
    String fileName = result.files.single.name;

    if (fileBytes == null) {
      setState(() {
        isLoading = false;
        message = "❌ Impossible de lire le fichier";
      });
      return;
    }

    try {
      var response = await Envoyer(fileBytes, fileName);
      setState(() {
        isLoading = false;
        message = "✅ Fichier envoyé avec succès. ID: ${response['doc_id']}";
      });

      // 🎉 Afficher une boîte de dialogue après succès
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("✅ Succès"),
          content: Text("Le fichier a été envoyé avec succès."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
        message = "❌ Erreur: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestion des Fichiers")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, size: 150, color: Colors.blue), // 📤 Icône principale
            SizedBox(height: 10),
            Center(
              child: Text("Pour envoyer le fichier au serveur, cliquez sur le bouton ci-dessous.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: isLoading ? null : selectionEtEnvoi,
              icon: Icon(Icons.upload_file),
              label: Text("Envoyer le fichier"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            if (isLoading) CircularProgressIndicator(), // 🔄 Indicateur de progression
            if (message != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: message!.startsWith("✅") ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
