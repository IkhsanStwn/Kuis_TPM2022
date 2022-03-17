import 'package:flutter/material.dart';
import 'package:kuistpm2022/list_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromARGB(255, 28, 200, 138),
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children:[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  height: 300,
                  width: 600,
                  child: Card(
                    color: Color.fromARGB(255, 248, 249, 252),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                        _usernameField(),
                        _passwordField(),
                        _loginButton(context),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: TextFormField(
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                  color: (isLoginSuccess) ? Color.fromARGB(255, 28, 200, 138) : Colors.red,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 28, 200, 138))
            ),
            hintText: "Username",
            label: Text("Username")
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                  color: (isLoginSuccess) ? Color.fromARGB(255, 28, 200, 138) : Colors.red,
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 28, 200, 138))
            ),
            hintText: "Password",
            label: Text("Password")
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Color.fromARGB(255, 28, 200, 138) :Color.fromARGB(
              255, 231, 74, 59),
        ),
        onPressed: (){
          String pesan = "";
          if(username == "ikhsansetiawan" && password == "123190111"){
            setState(() {
              pesan ="Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListScreen())
            );
          } else {
            setState(() {
              pesan = "Login Failed";
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
              content: Text(pesan)
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('LOGIN'),
      ),
    );
  }
}