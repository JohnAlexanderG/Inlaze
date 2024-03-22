import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInfoUser extends StatefulWidget {
  const GetInfoUser({super.key});

  @override
  State<GetInfoUser> createState() => _GetInfoUserState();
}

class _GetInfoUserState extends State<GetInfoUser> {
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _recuperarCredenciales();
  }

  void _recuperarCredenciales() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _password = prefs.getString('password') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('Usuario:'),
          Text(_username),
          const Text('Contraseña:'),
          Text(_password),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoginUser(false),
              );
              Navigator.pushNamed(context, '/');
            },
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
  }
}
