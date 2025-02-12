import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logisync_mobile/controllers/customer/jobrequestprovider.dart';
import 'package:logisync_mobile/controllers/customer/registerandlogin.dart';
import 'package:logisync_mobile/controllers/customerController.dart';
import 'package:logisync_mobile/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:logisync_mobile/views/Drivers/home.dart';
import 'package:logisync_mobile/views/account/driverRegistration.dart';
import 'package:logisync_mobile/views/account/login.dart';
import 'package:logisync_mobile/views/account/customerregistration.dart';
import 'package:logisync_mobile/views/customer/home.dart';
import 'package:logisync_mobile/views/account/welcome.dart';
import 'package:logisync_mobile/views/customer/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final role = prefs.getString('role'); // Retrieve the user's role

  String initialRoute;

  // Determine the initial route based on login state and role
  if (!isLoggedIn) {
    initialRoute = '/account/login'; // Redirect to login if not logged in
  } else if (role == 'CUSTOMER') {
    initialRoute = '/customer/home'; // Redirect customer to their home
  } else if (role == 'DRIVER') {
    initialRoute = '/Drivers/home'; // Redirect driver to their home
  } else {
    initialRoute = '/'; // Fallback route
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiService()),
        ChangeNotifierProvider(create: (context) => LoginAndRegisterController()),
        ChangeNotifierProvider(create: (context) => JobRequestProvider()),
        ChangeNotifierProvider(create: (_) => CustomerController()),
      ],
      child: MyApp(initialRoute: initialRoute),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required String initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) async {
    // Check the login state
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Redirect to login if the user is not logged in
    if (!isLoggedIn ) {
      return '/account/login';
    }
return null;
      }, routes: [
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
              return const CustomerRegistation();
            },
           
           ),
           //route for customers
           GoRoute(
            path:'/customer/home',
            builder: (context, state) {
              return const Home();
            }
            ),
             GoRoute(
            path:'/customer/request',
            builder: (context, state) {
              return const Homepage();
            }
            ),
             GoRoute(
            path:'/customer/payments',
            builder: (context, state) {
              return const Home();
            }
            ),
             GoRoute(
            path:'/customer/invoice',
            builder: (context, state) {
              return const Home();
            }
            ),

            //route for drivers
            GoRoute(
            path:'/account/driverregistration',
            builder: (context, state) {
              return const DriverRegistration();
            }
            ),
            GoRoute(
              path: '/Drivers/home',
              builder: (context,state){
                return  const DriverHome();
              }
           ),
          //  GoRoute(
          //     path: '/driver/job',
          //     builder: (context,state){
          //       return const DriverHome();
          //     }
          //  )
          ],
        ),
      ]
      , 
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
