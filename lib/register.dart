import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pink, Colors.purpleAccent],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_add,
                    color: Colors.pink[400],
                    size: 50,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField('Username', Icons.person, usernameController),
                SizedBox(height: 20),
                _buildTextField('Email', Icons.email, emailController),
                SizedBox(height: 20),
                _buildTextField('Password', Icons.lock, passwordController,
                    obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await _registerUser(context);
                    Navigator.pop(context); // Navigate back to the login page
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Colors.purpleAccent,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String labelText, IconData icon, TextEditingController controller,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Future<void> _registerUser(BuildContext context) async {
    // Validate user input
    String? username = usernameController.text;
    String? email = emailController.text;
    String? password = passwordController.text;

    try {
      // Check if any of the input fields are null
      if (username == null || email == null || password == null) {
        throw Exception('Please fill in all fields.');
      }

      // Create a new user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // User registration successful
      // Here, you can navigate to another page, display a success message, etc.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      // Display an error message or handle invalid input
      // For example, show a snackbar indicating the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred.'),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
