import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/views/account/driverRegistration.dart';
import 'package:logisync_mobile/views/account/login.dart';
import 'package:logisync_mobile/views/account/customerregistration.dart';
import 'package:logisync_mobile/views/customer/home.dart';
import 'package:logisync_mobile/views/account/welcome.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      

      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,

            );
          },

          routes: [

            GoRoute(
              path: '/',
              builder: (context,state){
                  return const Welcome();
                  },                
              ),
            GoRoute(
              path: '/account/login',
              builder: (context, state) {
                return Login();
              },
           ),
           GoRoute(
            path: '/account/customerregistration',
            builder: (context, state){
              return CustomerRegistation();
            },
           
           ),
           GoRoute(
            path:'/customer/home',
            builder: (context, state) {
              return const Home();
            }
            ),
            GoRoute(
            path:'/account/driverregistration',
            builder: (context, state) {
              return DriverRegistration();
            }
            )
            // GoRoute(
            //   path: '/driver/home',
            //   builder: (context,state){
            //     return DriverHome();
            //   }
          //  )
          ],
        ),
      ],
    );


    return MaterialApp.router(
      themeMode: ThemeMode.dark,
       routerConfig: router,
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      // body: Center(

      //   child: Column(

      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}
