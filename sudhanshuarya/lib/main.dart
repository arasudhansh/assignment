import 'package:flutter/material.dart';

import 'package:sudhanshuarya/screens/spalsh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

 const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:SpalshScreen(),
    );
  }
}
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final plugin = FacebookLogin(debug: true);

//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHome(plugin: plugin),
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   final FacebookLogin plugin;

//   const MyHome({Key? key, required this.plugin}) : super(key: key);

//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   String? _sdkVersion;
//   FacebookAccessToken? _token;
  

//   @override
//   void initState() {
//     super.initState();

//     _getSdkVersion();
//     _updateLoginInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLogin = _token != null ;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login via Facebook example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
//         child: Center(
//           child: Column(
//             children: <Widget>[
   
//               if (isLogin)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: _buildUserInfo(context, _token!),
//                 ),
//               isLogin
//                   ? OutlinedButton(
//                       child: const Text('Log Out'),
//                       onPressed: _onPressedLogOutButton,
//                     )
//                   : OutlinedButton(
//                       child: const Text('Log In'),
//                       onPressed: _onPressedLogInButton,
//                     ),
           
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildUserInfo(BuildContext context, 
//       FacebookAccessToken accessToken, ) {
    
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
        
       
//         Text(
//           accessToken.token,
//           softWrap: true,
//         ),
//         // if (email != null) Text('Email: $email'),
//       ],
//     );
//   }

//   Future<void> _onPressedLogInButton() async {
//     await widget.plugin.logIn(permissions: [
//       FacebookPermission.publicProfile,
//       FacebookPermission.email,
//     ]);
//     await _updateLoginInfo();
//   }

  

//   Future<void> _onPressedLogOutButton() async {
//     await widget.plugin.logOut();
//     await _updateLoginInfo();
//   }

//   Future<void> _getSdkVersion() async {
//     final sdkVesion = await widget.plugin.sdkVersion;
//     setState(() {
//       _sdkVersion = sdkVesion;
//     });
//   }

//   Future<void> _updateLoginInfo() async {
//     final plugin = widget.plugin;
//     final token = await plugin.accessToken;
//     FacebookUserProfile? profile;
//     String? email;
//     String? imageUrl;

//     if (token != null) {
//       profile = await plugin.getUserProfile();
//       if (token.permissions.contains(FacebookPermission.email.name)) {
//         email = await plugin.getUserEmail();
//       }
//       imageUrl = await plugin.getProfileImageUrl(width: 100);
//     }

//     setState(() {
//       _token = token;
      
//     });
//   }
// }