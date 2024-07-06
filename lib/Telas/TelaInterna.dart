import 'package:enercicio/auth.dart';
import 'package:flutter/material.dart';

class TelaInterna extends StatefulWidget{
  const TelaInterna ({super.key});

  @override
  State<TelaInterna> createState() => _TelaInternaState();
}

class _TelaInternaState extends State<TelaInterna> {
  AuthService _authServ = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
            "Mini App",
        style: TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child:  Container(
          height: 300,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            border:  Border.all(
              color: const Color.fromARGB(255, 240, 248, 255),
              width: 4,
            ),
          ),
          child:  Column(
            children: [
              const Padding(padding:  EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Olá, seja bem-vindo! ", style: TextStyle(color: Colors.white)),
                    Text("Usuário", style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Padding(padding: const EdgeInsets.fromLTRB(8,0, 8, 16),
              child: Divider(
                color: Colors.black,
                ),
              ),
              ElevatedButton(onPressed: () {
                _authServ.logout();
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                child:
                const Text("Logout",
                  style:  TextStyle(
                  color: Colors.white,
                  fontSize: 18,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}