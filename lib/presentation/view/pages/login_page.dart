import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gannar/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  Future _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Aquí iría la lógica para enviar los datos del formulario a algún servicio
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('username', _username);
      await prefs.setString('password', _password);
      if (kDebugMode) {
        print('Username: $_username');
        print('Password: $_password');
      }
      if (!mounted) return;
      authenticationBloc.add(LoginUser(true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/gannar_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Usuario'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduzca su nombre de usuario';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _username = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce tu contraseña';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _submitForm(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 32.0,
                          ),
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
