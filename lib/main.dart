import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kutuku/core/data/client.dart';
import 'package:kutuku/core/data/repository/auth_repository.dart';
import 'package:kutuku/core/data/repository/product_repository.dart';
import 'package:kutuku/core/navigation/router.dart';
import 'package:kutuku/core/servise/auth_localdatasourse.dart';
import 'package:kutuku/core/servise/auth_source.dart';
import 'package:kutuku/features/auth/manager/auth_bloc.dart';
import 'package:kutuku/features/user/manager/user_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          Provider(create: (context) => AuthRepository(authDatasource: AuthDatasource(), authLocalDatasource: AuthLocalDataSource()),),
          BlocProvider(create: (context) => AuthBloc(repo: context.read()),),
          Provider(create: (context) => ApiClient(),),
          Provider(create: (context) => ProductRepository(client: context.read()),),
          BlocProvider(create: (context) => UserBloc(repo: context.read()),)
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}

