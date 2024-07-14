import 'package:careernavigator/Controller/Providers/userprovider.dart';
import 'package:careernavigator/Controller/adminbackendservices.dart';
import 'package:careernavigator/Controller/institutionbackend.dart';
import 'package:careernavigator/View/Modules/Admin/addinstitutions.dart';
import 'package:careernavigator/View/Modules/Admin/bottombar.dart';
import 'package:careernavigator/View/Modules/Admin/counsellors.dart';
import 'package:careernavigator/View/Modules/Admin/institutionadmin.dart';
import 'package:careernavigator/View/Modules/Counsellors/appointment.dart';
import 'package:careernavigator/View/Modules/Counsellors/notifications.dart';
import 'package:careernavigator/View/Modules/Counsellors/profile.dart';
import 'package:careernavigator/View/Modules/Counsellors/reporting.dart';
import 'package:careernavigator/View/Modules/Institutions/addcourse.dart';
import 'package:careernavigator/View/Modules/Institutions/addfaculty.dart';
import 'package:careernavigator/View/Modules/Institutions/addinstitution.dart';
import 'package:careernavigator/View/Modules/Institutions/addplacement.dart';
import 'package:careernavigator/View/Modules/Institutions/Deleted/institutionfirstpage.dart';
import 'package:careernavigator/View/Modules/Institutions/splashinstitut.dart';
import 'package:careernavigator/View/Modules/Institutions/university.dart';
import 'package:careernavigator/View/Modules/Users/counsellors.dart';
import 'package:careernavigator/View/Modules/Users/courses.dart';
import 'package:careernavigator/View/Modules/Users/forgotpassword.dart';
import 'package:careernavigator/View/Modules/Users/help.dart';
import 'package:careernavigator/View/Modules/Users/home.dart';
import 'package:careernavigator/View/Modules/Users/homelistcourses.dart';
import 'package:careernavigator/View/Modules/Users/institutions.dart';
import 'package:careernavigator/View/Modules/Users/loginpage.dart';
import 'package:careernavigator/View/Modules/Users/notifications.dart';
import 'package:careernavigator/View/Modules/Users/popularcourses.dart';
import 'package:careernavigator/View/Modules/Users/profile.dart';
import 'package:careernavigator/View/Modules/Users/registration.dart';
import 'package:careernavigator/View/Modules/Users/scholarship.dart';
import 'package:careernavigator/View/Modules/Users/splashscreen.dart';
import 'package:careernavigator/View/welcome/splashscreenwlcm.dart';
import 'package:careernavigator/View/welcome/welcome%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/Providers/counsellorbackendservice.dart';
import 'Controller/backendservices.dart';
import 'View/Modules/Admin/loginn.dart';
import 'View/Modules/Counsellors/loginsign.dart';
import 'View/Modules/Counsellors/splashh.dart';
import 'View/Modules/Institutions/keralauniversity.dart';
import 'View/Modules/Institutions/logininstitut.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (context) => BackendServices(),),
        ChangeNotifierProvider(create: (context) => UserProvider(),),
        ChangeNotifierProvider(create: (context) => CounsellorService(),),
        // ChangeNotifierProvider(create: (context) => InstitutionBackend(),),
        ChangeNotifierProvider(create: (context) => AdminBackend(),),
        // ChangeNotifierProvider(create: (context) => PlacementFormProvider(),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AppSplash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
