import 'package:enercicio/Utilitarios/snackbar.dart';
import 'package:enercicio/auth.dart';
import 'package:flutter/material.dart';
import 'TelaInterna.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool entrar = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  AuthService _authServ = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (entrar)
            ? Colors.redAccent
            : const Color.fromARGB(255, 26, 72, 211),
        title: Text(
          (entrar) ? "Login" : "Cadastro",
          style: const TextStyle(color: Color.fromARGB(221, 255, 255, 255), fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor:
          (entrar) ? Colors.black45 : Color.fromARGB(255, 118, 120, 129),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    (entrar)
                        ? Icons.account_circle_rounded
                        : Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 110,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _emailController,
                    validator: (String? value) {
                      if (value == null) {
                        return "O campo Email precisa ser preenchido...";
                      }
                      if (value.length < 5) {
                        return "O campo Email precisa ter o minimo 5 caracteres";
                      }
                      if (!value.contains("@")) {
                        return "O campo email precisa ter o (@)";
                      }
                      if (!value.contains(".")) {
                        return "O campo email precisa ter o (.)";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "E-mail",
                        fillColor: Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        )),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _senhaController,
                    validator: (String? value) {
                      if (value == null) {
                        return "O campo Senha precisa ser preenchido...";
                      }
                      if (value.length < 8) {
                        return "O campo Senha precisa ter o minimo 8 caracteres";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "password",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        )),
                    obscureText: true,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                  ),
                  Visibility(
                      visible: !entrar,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _confirmaSenhaController,
                            validator: (String? value) {
                              if (value == null) {
                                return "O campo Confirme a Senha precisa ser preenchido...";
                              }
                              if (value.length < 8) {
                                return "O campo Confirme a Senha precisa ter o minimo 8 caracteres";
                              }
                              if (value != _senhaController.text) {
                                return "O campo Confirme a Senha precisa conter o mesmo valor da senha";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "confirm password",
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16,
                                )),
                            obscureText: true,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w200,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _nameController,
                            validator: (String? value) {
                              if (value == null) {
                                return "O Name precisa ser preenchido...";
                              }
                              if (value.length < 3) {
                                return "O campo Name precisa ter o minimo 8 caracteres";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: "Name",
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          botaoEntrar();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (entrar)
                                ? Colors.redAccent
                                : const Color.fromARGB(255, 26, 72, 211),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100))),
                        child: Text(
                          (entrar) ? "Join" : "Register",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        entrar = !entrar;
                      });
                    },
                    child: Text(
                      (entrar) ? "Register" : "Join",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      ),
                    ),
                  )
                ])),
      ),
    );
  }

  botaoEntrar() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String confirmaSenha = _confirmaSenhaController.text;
    String nome = _nameController.text;

    if (_formKey.currentState!.validate()) {
      if (entrar) {
        print("Entrada validada");
        _authServ.logUser(email: email, senha: senha).then((String? erro) {
          if (erro != null) {
            showSnackbar(context: context, text: erro);
          }else {
            showSnackbar(context: context, text: "Login efetuado com sucesso", isErro: false);
          }
        });
      } else {
        print("cadastro validado");
        print("${_emailController.text}");
        print("${_senhaController.text}");
        print("${_confirmaSenhaController.text}");
        print("${_nameController.text}");
        _authServ
            .cadUser(
                email: email,
                senha: senha,
                confirmaSenha: confirmaSenha,
                nome: nome)
            .then(
              (String? erro) {
                if (erro != null) {
                  showSnackbar(context: context, text: erro);
                }else {
                  showSnackbar(context: context, text: "Cadastro efetuado com sucesso", isErro: false);
                }
              },
            );
      }
    } else {
      print("Não funcionou");
    }
  }
}
