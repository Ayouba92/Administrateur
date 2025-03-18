import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Resultat extends StatelessWidget {
  const Resultat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("Résultat",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold)),
        ),
        backgroundColor:Colors.deepOrange,
      ),
      body: FileImportWidget()
      );
  }
}

class FileImportWidget extends StatefulWidget {
  @override
  _FileImportWidgetState createState() => _FileImportWidgetState();
}

class _FileImportWidgetState extends State<FileImportWidget> {
  String? selectedFile;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name; // Nom du fichier sélectionné
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GME : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GC : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GEEA : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Geol-Mine : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Topo : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GIT : ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: pickFile,
              style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: Text('Importer'),
              
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Fichier : $selectedFile',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 50,
          width: 500,
          child: ElevatedButton(
            
            onPressed: (){
              // Navigator.pushReplacement(context, 
              // MaterialPageRoute(builder:(context){
                  
              // }));
              
            },
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
            ),
              child: const Text(
              "Envoyer ",
              style: const TextStyle(
                fontSize: 20
              ),
              )
              ),
        ),
        

        ]
      ),
    );
  }
}