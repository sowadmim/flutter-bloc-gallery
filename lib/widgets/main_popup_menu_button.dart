import 'package:bloc_firebase_photo_gallery/bloc/bloc.dart';
import 'package:bloc_firebase_photo_gallery/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuAction { logout, deleteAccount }

class MainPopupMenuButton extends StatelessWidget {
  const MainPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            final shouldLogOut = await showLogOutDialog(context);
            if (shouldLogOut) {
              context.read<AppBloc>().add(const AppEventLogOut());
            }
            break;
          case MenuAction.deleteAccount:
            final shouldDeleteAccount = await showDeleteAccountDialog(context);
            if (shouldDeleteAccount) {
              context.read<AppBloc>().add(const AppEventDeleteAccount());
            }
            break;
        }
      },
      itemBuilder: (context) {
        return const [
          PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text('Logout'),
          ),
          PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text('Delete Account'),
          ),
        ];
      },
    );
  }
}
