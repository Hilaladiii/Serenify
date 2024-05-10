import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serenify/bloc/article/article_bloc.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/bloc/community/community_bloc.dart';
import 'package:serenify/bloc/seminar/seminar_bloc.dart';
import 'package:serenify/bloc/test/test_bloc.dart';
import 'package:serenify/bloc/user/user_bloc.dart';
import 'package:serenify/presentations/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => TestBloc()),
        BlocProvider(create: (context) => CommunityBloc()),
        BlocProvider(create: (context) => ArticleBloc()),
        BlocProvider(create: (context) => SeminarBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'Serenify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
