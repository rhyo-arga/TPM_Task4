import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tpm_task4/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool isUsername = true;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
            title: Text("Login Page"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        )
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                // color: Colors.blue,
                color: (isLoginSuccess||isUsername) ? Colors.blue : Colors.red,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 3,
                color: Colors.blue,
              )
          ),
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                // color: Colors.blue,
                color: (isLoginSuccess||isPassword) ? Colors.blue : Colors.red,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 3,
                color: Colors.blue,
              )
          ),
        ),
      ),
    );
  }

  Widget _loginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: (isLoginSuccess) ? Colors.blue : Colors.red
        ),
        onPressed: (){
          String text = "";
          if(username == "rhyo" && password == "0059"){
            setState(() {
              isLoginSuccess = true;
              isUsername = true;
              isPassword = true;
              text = "Login Berhasil";
            });
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }
                ));

          }else if(username != "rhyo" && password == "0059"){
            setState(() {
              isLoginSuccess = false;
              isUsername = false;
              isPassword = true;
              text = "Login Gagal, Username Salah";
            });
          }else if(username == "rhyo" && password != "0059"){
            setState(() {
              isLoginSuccess = false;
              isUsername = true;
              isPassword = false;
              text = "Login Gagal, Password Salah";
            });
          }else{
            setState(() {
              isLoginSuccess = false;
              isUsername = false;
              isPassword = false;
              text = "Login Gagal";
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Login",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}
