import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/color_palette.dart';
import '../bloc/auth_bloc.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LoginDialog(),
    );
  }

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final _sessionController = TextEditingController();
  final _csrfController = TextEditingController();

  @override
  void dispose() {
    _sessionController.dispose();
    _csrfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.of(context).pop();
        }
      },
      child: AlertDialog(
        title: Row(
          children: [
            Icon(
              CupertinoIcons.person_crop_circle,
              color: ColorPalette.primary,
            ),
            const SizedBox(width: 8),
            const Text('Connect to LeetCode'),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To connect your LeetCode account, paste your session cookies '
                'from your browser. Open LeetCode in your browser, then:',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text(
                '1. Open DevTools (F12) → Application → Cookies\n'
                '2. Copy LEETCODE_SESSION value\n'
                '3. Copy csrftoken value',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sessionController,
                decoration: const InputDecoration(
                  labelText: 'LEETCODE_SESSION',
                  hintText: 'Paste your LEETCODE_SESSION cookie...',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _csrfController,
                decoration: const InputDecoration(
                  labelText: 'csrftoken',
                  hintText: 'Paste your csrftoken cookie...',
                ),
              ),
              const SizedBox(height: 8),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthError) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        state.message,
                        style: TextStyle(
                          color: ColorPalette.wrongAnswer,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return ElevatedButton(
                onPressed: isLoading ? null : _onConnect,
                child: isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Connect'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onConnect() {
    final session = _sessionController.text.trim();
    final csrf = _csrfController.text.trim();

    if (session.isEmpty || csrf.isEmpty) return;

    context.read<AuthBloc>().add(
      AuthLoginRequested(
        session: session,
        csrfToken: csrf,
      ),
    );
  }
}
