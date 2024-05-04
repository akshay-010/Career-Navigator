import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:careernavigator/View/Modules/Institutions/splashinstitut.dart';
import 'package:careernavigator/View/Modules/Users/courses.dart';
import 'package:careernavigator/View/Modules/Users/forgotpassword.dart';
import 'package:careernavigator/View/Modules/Users/help.dart';
import 'package:careernavigator/View/Modules/Users/home.dart';
import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:careernavigator/View/Modules/Users/institutions.dart';
import 'package:careernavigator/View/Modules/Users/loginpage.dart';
import 'package:careernavigator/View/Modules/Users/popularcourses.dart';
import 'package:careernavigator/View/Modules/Users/profile.dart';
import 'package:careernavigator/View/Modules/Users/registration.dart';
import 'package:careernavigator/View/Modules/Users/scholarship.dart';
import 'package:careernavigator/View/Modules/Users/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/Modules/Admin/loginn.dart';
import 'View/Modules/Counsellors/loginsign.dart';
import 'View/Modules/Counsellors/splashh.dart';
import 'firebase_options.dart';

void main() async{WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: InstituteSplash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
