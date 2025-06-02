import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/features/common/text_widget.dart';
import 'package:kutuku/features/home/manager/home_bloc.dart';
import 'package:kutuku/features/home/manager/home_state.dart';
import 'package:kutuku/features/user/manager/user_bloc.dart';
import 'package:kutuku/features/user/manager/user_event.dart';
import 'package:kutuku/features/user/manager/user_state.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(UserLoadEvent());
              },
              child: Text("Foydalanuvchilarni  yuklash"),
            ),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  final user = state.user;
                  if (state.status == UserStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.status == UserStatus.idle) {
                    return ListView.builder(
                      itemCount: user.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: TextWidget(text: user[index].email, fontSize: 18,),
                          leading: TextWidget(text: user[index].username, fontSize: 15,),
                        );
                      },
                    );
                  }
                  if (state.status == UserStatus.error) {
                    return Center(child: Text("Xatolik berdi", style: TextStyle(fontSize: 25)));
                  }
                  return Center(child: Text("Ma'lumot topilmadi", style: TextStyle(fontSize: 25)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
