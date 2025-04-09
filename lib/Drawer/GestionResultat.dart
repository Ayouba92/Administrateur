import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Resultat extends StatelessWidget {
  const Resultat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Résultat",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: const FileImportWidget(),
    );
  }
}

class FileImportWidget extends StatefulWidget {
  const FileImportWidget({super.key});

  @override
  _FileImportWidgetState createState() => _FileImportWidgetState();
}

class _FileImportWidgetState extends State<FileImportWidget> {
  final Map<String, String?> selectedFiles = {};

  Future<void> pickFile(String category) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFiles[category] = result.files.single.name; // Nom du fichier
      });
    }
  }

  Widget buildFileRow(String category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$category : ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () => pickFile(category),
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
          ),
          child: const Text('Importer'),
        ),
        if (selectedFiles[category] != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Fichier : ${selectedFiles[category]}',
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          const SizedBox(height: 15),
          buildFileRow("GME"),
          const SizedBox(height: 5),
          buildFileRow("GC"),
          const SizedBox(height: 5),
          buildFileRow("GEEA"),
          const SizedBox(height: 5),
          buildFileRow("Geol-Mine"),
          const SizedBox(height: 5),
          buildFileRow("Topo"),
          const SizedBox(height: 5),
          buildFileRow("GIT"),
          const SizedBox(height: 15),
          SizedBox(
            height: 50,
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                // Ajouter la logique pour l'envoi ici
              },
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
              ),
              child: const Text(
                "Envoyer",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
