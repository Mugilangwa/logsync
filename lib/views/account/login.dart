import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 227, 185, 235),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color:Colors.purple,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              )),
          Expanded(
              flex: 7,
              child: Center(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 20),
                        //jina la mteja
                        TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'UserName',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                            prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/icon/user.png', // Your icon image path
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                            
                          
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please fill your ,Username";
                              }
                              return null;
                            }),

                        const SizedBox(height: 15),
                        //passwodi ya mteja
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                              
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            suffixIcon: const Icon(Icons.visibility_off),
                            prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/icon/3d-unlocked.png', // Your icon image path
                              height: 20,
                              width: 20,
                            )
                            )
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/customer/home');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.amber,
                            ),
                            child: const Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold ,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 0, 0, 0),)
                                  
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Row(
                          children: [
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                ' OR Login with',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold ),
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.black,
                              thickness: 2,
                            )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icon/google.png',
                                  height: 24,
                                ),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                )),
                            const SizedBox(
                              width: 3,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icon/twitter.png',
                                height: 24,
                              ),
                              label: const Text(""),
                              style: ElevatedButton.styleFrom(),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icon/facebook.png',
                                  height: 28,
                                  fit: BoxFit.fill,
                                ),
                                label: const Text(""),
                                style: ElevatedButton.styleFrom())
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: InkWell(
                            
                           onTap: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Hi Welcome, Please Tell Us You Want to Register as',
          style: TextStyle(fontSize: 15),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
          context.go('/account/customerregistration');
                        },
              child: const Text(
                'Customer',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/account/driverregistration');
               
              },
              child: const Text(
                'Driver',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    },
  );
},
 child: const Text(
                              "Don't Have Account? Register Here",
                              style: TextStyle(
                                fontSize: 15,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ]),
                ),
              )))
        ],
      ),
    );
  }
}
