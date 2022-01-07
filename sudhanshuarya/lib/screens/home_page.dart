// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

// // 
// //
// //import 'login_page.dart';


// class HomePage extends StatefulWidget {
//   final plugin = FacebookLogin(debug: true);
//  HomePage({Key? key}) : super(key: key);
  

//   @override
//   _HomePageState createState() => _HomePageState();

// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 240),
//                 child: Center(
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(fontSize: 30),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Center(
//                   child: Text(
//                     'Sigxxxxn In',
//                     style: TextStyle(fontSize: 30),

//                   ),
//                 ),
//               ),
              
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sudhanshuarya/models/home_page_model.dart';
// import 'package:carousel_slider/carousel_slider.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<HomepageModel> fetchData() async {
    //  var jsonData = await http.get(
    //     'https://61c30cc09cfb8f0017a3e91f.mockapi.io/virtoustack/paths');
    // var fetchData = jsonDecode(jsonData.body);

  final response = await http
      .get(Uri.parse('https://61c30cc09cfb8f0017a3e91f.mockapi.io/virtoustack/paths'));
print(response);
  if (response.statusCode == 200) {
    
   
     return HomepageModel.fromJson(jsonDecode(response.body[2]));
    // return HomepageModel.fromJson((jsonresponse[0]);
  } else {
    
    throw Exception('Failed');
  }
}
 late Future<HomepageModel> futureData;
     void initState() {
    super.initState();
    futureData = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<HomepageModel>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
    
   

        
  
  }
}