import 'package:flutter/material.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<AuthProvider>().logout().then((_) {
            Navigator.pushReplacementNamed(context, RouterName.loginPage);
          });
        },
        icon: const Icon(Icons.logout));
  }
}
