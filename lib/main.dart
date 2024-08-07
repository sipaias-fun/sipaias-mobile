import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sipaias_fun_mobile/cores/config/bloc/general_bloc.dart';
import 'package:sipaias_fun_mobile/cores/config/init.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/utils/util.dart';
import 'package:sipaias_fun_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sipaias_fun_mobile/features/auth/presentation/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<GeneralBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    context.read<GeneralBloc>().add(ContextEvent(context));

    return MaterialApp(
      color: Palette.white,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      routes: route,
      initialRoute: LoginView.routeName,
    );
  }
}
