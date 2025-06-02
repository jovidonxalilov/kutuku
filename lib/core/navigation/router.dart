import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kutuku/core/data/model/product_model.dart';
import 'package:kutuku/core/data/repository/auth_repository.dart';
import 'package:kutuku/core/navigation/routes.dart';
import 'package:kutuku/core/servise/auth_localdatasourse.dart';
import 'package:kutuku/core/servise/auth_source.dart';
import 'package:kutuku/features/auth/manager/auth_bloc.dart';
import 'package:kutuku/features/auth/page/sign_up_detail.dart';
import 'package:kutuku/features/home/manager/home_bloc.dart';
import 'package:kutuku/features/home/manager/home_event.dart';
import 'package:kutuku/features/home/page/home_detail.dart';
import 'package:kutuku/features/home/page/product_detail.dart';
import 'package:kutuku/features/onboarding/page/onboarding_detail.dart';
import 'package:kutuku/features/user/manager/user_bloc.dart';
import 'package:kutuku/features/user/manager/user_event.dart';
import 'package:kutuku/features/user/page/user_detail.dart';

import '../../features/splash/page/splash_detail.dart';

final router = GoRouter(
  initialLocation: Routes.user,
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
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          repo: context.read(),
        )..add(HomeLoadEvent()),
        child: HomeDetail(),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpDetail(),
    ),
    GoRoute(
      path: Routes.productDetail,
      builder: (context, state) {
        final product = state.extra;
        if (product == null || product is! ProductModel) {
          return Scaffold(
            body: Center(child: Text('Mahsulot topilmadi')),
          );
        }
        return BlocProvider(
          create: (context) => HomeBloc(repo: context.read()),
          child: ProductDetail(product: product),
        );
      },
    ),
    GoRoute(
      path: Routes.user,
      builder: (context, state) => BlocProvider(
        create: (context) => UserBloc(repo: context.read()),
        child: UserDetail(),
      ),
    ),
  ],
);
