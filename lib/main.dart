import 'package:flutter/material.dart';
import './food/menu_food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pertemuan Ketiga",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;
  bool _passwordvisible = false;

  void initstate() {
    _passwordvisible = false;
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FoodMenuPage(username: _username, nickname: _nickname)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Halaman Login"),
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            TextFormField(
              enabled: true,
              onChanged: (value) {
                _nickname = value;
              },
              decoration: InputDecoration(
                hintText: 'Masukkan Panggilan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(width: 90000, color: Colors.blue)),
              ),
            ),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
            hintText: 'Masukkan Username',
            hintStyle: TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 100, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  _passwordvisible = !_passwordvisible;
                });
              },
              icon: Icon(Icons.remove_red_eye),
            ),
            hintText: 'Masukkan Password',
            hintStyle: TextStyle(color: Colors.black26),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(width: 100, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isClicked == true
                ? WidgetStateProperty.all(Colors.blue)
                : WidgetStateProperty.all(Colors.red)),
        onPressed: () {
          if (_username == "123" && _password == "123") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil'),
              ),
            );
            setState(() {
              isClicked = !isClicked;
              print(isClicked);
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
