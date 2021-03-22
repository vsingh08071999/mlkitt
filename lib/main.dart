import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mlkit_demo/constants/global.dart' as globals;
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mlkit_demo/ml_kit/mlkit_Home.dart';
import 'package:mlkit_demo/screens/homeScreen.dart';
import 'package:mlkit_demo/screens/splashScreen.dart';
// import 'Drawer/collasping_navigation_drawer.dart';
import 'bloc/connectivityBloc.dart';
import 'bloc/mainBloc.dart';
import 'constants/themes.dart';
import 'loginScreen/AdminSignIn.dart';
//test
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print('cubit: ${cubit.runtimeType}, change: $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bloc: ${bloc.runtimeType}, transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //BlocSupervisor().delegate = SimpleBlocDelegate();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) => runApp(

      MultiBlocProvider(
          providers: MainBloc.allBlocs(),
          child:
          new MyApp()
      )
  ));
}


class MyApp extends StatefulWidget {

  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setCustomeTheme(index);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // final FirebaseMessaging _fcm = FirebaseMessaging();
  // StreamSubscription iosSubscription;


  @override
  void initState() {

    globals.connectivityBloc = ConnectivityBloc();
    globals.connectivityBloc.onInitial();

    super.initState();
    // initState  if (Platform.isIOS) {
    //     iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
    //     });
    //
    //     _fcm.requestNotificationPermissions(IosNotificationSettings());
    //   }
    //   _fcm.configure(
    //     onMessage: (Map<String, dynamic> message) async {
    //
    //       print("onMessage: $message");
    //
    //       showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           content: ListTile(
    //             title: Text(message['notification']['title']),
    //             subtitle: Text(message['notification']['body']),
    //           ),
    //           actions: <Widget>[
    //             FlatButton(
    //               child: Text('Ok'),
    //               onPressed: () => Navigator.of(context).pop(),
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //     onLaunch: (Map<String, dynamic> message) async {
    //       print("onLaunch: $message");
    //
    //
    //     },
    //     onResume: (Map<String, dynamic> message) async {
    //       print("onResume: $message");
    //
    //     },
    //   );
  }

  void setCustomeTheme(int index) {
    setState(() {
      globals.colorsIndex = index;
      globals.primaryColorString = globals.colors[globals.colorsIndex];
      globals.secondaryColorString = globals.primaryColorString;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: globals.isLight ? Brightness.dark : Brightness.light,
    ));
    return Container(
      color: AllCoustomTheme.getThemeData().primaryColor,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: globals.appName,
          theme: AllCoustomTheme.getThemeData(),
          // routes: routes,
          home: SplashScreen()
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
//
// var routes = <String, WidgetBuilder>{
//   Routes.SPLASH: (BuildContext context) => new SplashScreen(),
//  Routes.LOGIN: (BuildContext context) => new LoginPage(),
//   Routes.HOME: (BuildContext context) => new HomeScreen(),
// };
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mlkit_demo/DetailScreen.dart';
//
// void main() => runApp(MaterialApp(
//       home: HomeScreen(),
//     ));
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<String> itemsList = [
//     'Text Scanner',
//     'Barcode Scanner',
//     'Label Scanner',
//     'Face Detection'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ML Kit Demo'),
//       ),
//       body: ListView.builder(
//           itemCount: itemsList.length,
//           itemBuilder: (context, index) {
//             return Card(
//               child: ListTile(
//                 title: Text(itemsList[index]),
//                 // leading: RaisedButton(
//                 //   child: Text("sjhd"),
//                 //   color: Colors.green,
//                 //   onPressed: (){
//                 //     FirebaseFirestore.instance.collection("users").doc("NYkrSyfEG4M0hfHSTCawYii2zw92").get().then((value) {
//                 //       print(value['name']);
//                 //     });
//                 //   },
//                 // ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailScreen(),
//                       settings: RouteSettings(arguments: itemsList[index]),
//                     ),
//                   );
//                 },
//               ),
//             );
//           }),
//     );
//   }
// }
