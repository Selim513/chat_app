import 'package:chat_app/bloc_observer.dart';
import 'package:chat_app/core/auth_bloc/auth_bloc.dart';
import 'package:chat_app/core/chat_cubit/chat_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(const MainApp());
  print('--------------------${FirebaseAuth.instance.currentUser?.uid}');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: LoginView()),
    );
  }
}
