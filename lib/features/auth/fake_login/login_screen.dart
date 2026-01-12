import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texa_core/features/auth/fake_login/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Выберите роль для входа (DEV MODE)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _buildRoleButton(context, "Водитель", "driver"),
            _buildRoleButton(context, "Получатель", "recipient"),
            _buildRoleButton(context, "Менеджер", "manager"),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String label, String role) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => context.read<AuthCubit>().devSetRole(role),
        child: Text(label),
      ),
    );
  }
}
