import 'package:flutter/cupertino.dart';
import 'package:kutuku/core/data/model/user_mode.dart';
import 'package:kutuku/core/servise/auth_localdatasourse.dart';

import '../../servise/auth_source.dart';
import '../model/auth_model.dart';

class AuthRepository extends ChangeNotifier {
  final AuthDatasource authDatasource;
  final AuthLocalDataSource authLocalDatasource;

  AuthRepository({
    required this.authDatasource,
    required this.authLocalDatasource,
  });


  Future<AuthModel?> getAuth() async {
    return await authLocalDatasource.getAuth();
  }

  Future<AuthModel> register({
    required String email,
    required String password,
    required String username
  }) async {
    try {
      final authModel = await authDatasource.register(
        username: username,
        email: email,
        password: password,
      );
      await authLocalDatasource.saveAuth(authModel);
      return authModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final authModel = await authDatasource.login(
        email: email,
        password: password,
      );
      await authLocalDatasource.saveAuth(authModel);
      return true;
    } catch (e) {
      rethrow;
    }
  }


   // Future<ProfileModel?> getUserProfile() async {
  //   // final auth = await getAuth();
  //   // if (auth == null) return null;
  //   final profile = await authDatasource.fetchUserProfile();
  //   return profile;
  // }


}
