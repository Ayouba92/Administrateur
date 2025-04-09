import 'package:admin/Acceuil.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
//import 'package:provider/provider.dart';



class connexion extends StatefulWidget {
  const connexion({super.key});

  @override
  State<connexion> createState() => _connexionState();
}

class _connexionState extends State<connexion> {
   //les variables pour controler les chaps de saisi
  final TextEditingController   emailController =TextEditingController();
  final TextEditingController   nomcompletController =TextEditingController();
  final TextEditingController   motDePasseController =TextEditingController();

  //Une fonction future pour envoyer les data
  Future<void> SeConnecter() async{
    final respose=await http.post(
      Uri.parse('http://192.168.1.21:5000/Login'),
      headers: {"Content-Type": "application/json"},
      body:convert.jsonEncode({
        "email":emailController.text,
        "motDePasse":motDePasseController.text
      }),
    );
    if(respose.statusCode==200){
      final data=convert.jsonDecode(respose.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('Connexion réussie!')),
        );
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PageAcceuil()),//pour etre rediriger vers la page d'acceuil après avoir envoyer les données
        );
    }
    else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('E-mail ou mot de passe incorrect!')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
   // final gererletheme=Provider.of<GererleTheme>(context);
    //final textColor=gererletheme.themeapplique ? Colors.white : Colors.black;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bienvenue à l'ENI-ABT", style: TextStyle(fontSize:25, fontWeight: FontWeight.bold)),
          backgroundColor:Colors.deepOrange,
        ),
        body: ListView(
          children: [Column(
            children: [
              Center(               
                child: Form(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      children: [
                        const Text("Entrez vos informations pour vous connecter",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                        SizedBox(height:50),
                        TextField(
                          controller:emailController,
                          style: TextStyle(
                            color: Colors.deepOrangeAccent
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 226, 193, 204),
                            hintText: "Entrez votre e-mail",
                            hintStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            helperText: "Votre e-mail doit contenir @",
                            helperStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            prefixIcon: Icon(Icons.email, color:Colors.deepOrangeAccent)
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: motDePasseController,
                          style: TextStyle(
                            color: Colors.deepOrangeAccent
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 226, 193, 204),
                            hintText: "Entrez votre mot de passe",
                            hintStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                            helperText: "Votre mot de passe doit contenir...",
                            helperStyle: TextStyle(
                              color: Colors.deepOrangeAccent
                            ),
                            prefixIcon: Icon(Icons.key, color:Colors.deepOrangeAccent)
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: 500,
                          child: ElevatedButton(
                            
                            onPressed: (){
                              //Navigator.pushReplacement(context,
                                  //MaterialPageRoute(builder: (context) => PageAcceuil()));
                              // Navigator.pushReplacement(context, 
                              // MaterialPageRoute(builder:(context){
                              //     return HomePage();
                              // }));
                              SeConnecter();
                            },
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                              backgroundColor: WidgetStateProperty.all<Color>(Colors.deepOrange),
                            ),
                             child: const Text(
                              "Connecter",
                              style: TextStyle(
                                fontSize: 20
                              ),
                              )
                             ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  )
                  ),
              ),
              SizedBox(height: 20),
            ],
          ),]
        ),
      );
  }
}