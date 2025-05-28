import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kutuku/core/data/repository/auth_repository.dart';
import 'package:kutuku/core/navigation/routes.dart';
import 'package:kutuku/core/servise/auth_localdatasourse.dart';
import 'package:kutuku/core/servise/auth_source.dart';
import 'package:kutuku/features/auth/manager/auth_bloc.dart';
import 'package:kutuku/features/auth/page/sign_up_detail.dart';
import 'package:kutuku/features/onboarding/page/onboarding_detail.dart';

import '../../features/splash/page/splash_detail.dart';

final router = GoRouter(
  initialLocation: Routes.signUp,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthBloc(
            repo: AuthRepository(
                authDatasource: AuthDatasource(),
                authLocalDatasource: AuthLocalDataSource())),
        child: SignUpDetail(),
      ),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingDetail(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpDetail(),
    ),
  ],
);
