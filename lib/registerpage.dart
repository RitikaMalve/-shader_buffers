import 'package:flutter/material.dart';
import 'package:sky/main.dart';

import 'Databse/databasehelper.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();

  //
  void _submit() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      String Username = username.text;
      String Email = emailId.text;
      String Mobile = mobileno.text;
      String Password = password.text;
      String ConfirmPassword = Confirmpassword.text;

      if (Password != ConfirmPassword) {
        // check that password and confirm password match or if match then submit otherwise show toast message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Passwords do not match',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ));
        return;
      }

      Map<String, dynamic> userData = {
        'Username': Username,
        'EmailId': Email,
        'MobileNo': int.parse(Mobile.substring(3)),
        'password': Password,
      };
      int userId = await DatabaseHelper.instance.insert(userData);

      if (userId > 0) {
        // in that condition check that user inserted our data or not
        print('User inserted with ID: $userId');
        Navigator.pop(context);
      } else {
        print('Failed to insert user data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Registration Form',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                width: 300,
                child: TextFormField(
                  controller: username,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 300,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: emailId,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 15),
                        labelText: 'Email id',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.amber,
                        )),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 300,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Mobileno';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: mobileno,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 15),
                      labelText: 'Mobile no',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: const Icon(
                        Icons.phone,
                        color: Colors.amber,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ConfirmPassword';
                    }
                    return null;
                  },
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: Confirmpassword,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(
                      Icons.visibility,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Text(
                    'Allready I Have an Account ?',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
