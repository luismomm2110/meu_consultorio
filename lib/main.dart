import 'package:flutter/material.dart';
import 'package:meu_consultorio/data/doctor_dao.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meu_consultorio/ui/home_doctor.dart';
import 'package:meu_consultorio/ui/home_patient.dart';
import 'package:meu_consultorio/ui/signup.dart';
import 'package:provider/provider.dart';
import '../data/chart_dao.dart';
import '../data/user_dao.dart';
import 'data/patient_dao.dart';
import 'ui/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyClinic());
}

class MyClinic extends StatelessWidget {
  MyClinic({Key? key}) : super(key: key);

  final userDao = UserDao();
  final doctorDao = DoctorDao();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<ChartDao>(
          lazy: false,
          create: (_) => ChartDao(),
        ),
        Provider<DoctorDao>(
          lazy: false,
          create: (_) => DoctorDao(),
        ),
        Provider<PatientDao>(
          lazy: false,
          create: (_) => PatientDao(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyCLinic',
          theme: ThemeData(primaryColor: Colors.white),
          home: Consumer<UserDao>(builder: (context, userDao, child) {
            return const Login();
          }),
          routes: {
            '/register': (context) => SignUp(),
            '/login': (context) => Login(),
            '/doctor_dashboard': (context) => HomeDoctor(),
            '/patient_dashboard': (context) => HomePatient(),
          }),
    );
  }

  Future<bool> _checkIfDoctor() async {
    final isDoctor = await doctorDao.isUserDoctor(userDao.email()!);
    return isDoctor;
  }
}
