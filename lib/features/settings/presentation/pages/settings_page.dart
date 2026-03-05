import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/leetcode_languages.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/editor_theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/widgets/login_dialog.dart';
import '../bloc/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 38, color: Colors.transparent),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Row(
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account section
                  _SectionHeader(title: 'Account'),
                  const SizedBox(height: 12),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthAuthenticated) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.person_circle_fill,
                                  size: 40,
                                  color: ColorPalette.primary,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.user.username,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        'Connected to LeetCode',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: ColorPalette.accepted,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthLogoutRequested());
                                  },
                                  child: const Text('Disconnect'),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.person_circle,
                                size: 40,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Not connected',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      'Connect your LeetCode account to submit solutions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    LoginDialog.show(context),
                                child: const Text('Connect'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Editor section
                  _SectionHeader(title: 'Editor'),
                  const SizedBox(height: 12),
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _SettingsRow(
                                label: 'Default Language',
                                child: DropdownButton<String>(
                                  value: state.defaultLanguage,
                                  isDense: true,
                                  underline: const SizedBox.shrink(),
                                  items: LeetCodeLanguages.all
                                      .map(
                                        (l) => DropdownMenuItem(
                                          value: l.slug,
                                          child: Text(l.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context
                                          .read<SettingsCubit>()
                                          .setDefaultLanguage(value);
                                    }
                                  },
                                ),
                              ),
                              const Divider(),
                              _SettingsRow(
                                label: 'Font Size',
                                child: Row(
                                  children: [
                                    Text(
                                      '${state.editorFontSize.toInt()}px',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: 150,
                                      child: Slider(
                                        value: state.editorFontSize,
                                        min: 10,
                                        max: 24,
                                        divisions: 14,
                                        onChanged: (value) {
                                          context
                                              .read<SettingsCubit>()
                                              .setEditorFontSize(value);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              _SettingsRow(
                                label: 'Tab Size',
                                child: DropdownButton<int>(
                                  value: state.editorTabSize,
                                  isDense: true,
                                  underline: const SizedBox.shrink(),
                                  items: [2, 4, 8]
                                      .map(
                                        (size) => DropdownMenuItem(
                                          value: size,
                                          child: Text('$size spaces'),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context
                                          .read<SettingsCubit>()
                                          .setEditorTabSize(value);
                                    }
                                  },
                                ),
                              ),
                              const Divider(),
                              _SettingsRow(
                                label: 'Editor Theme',
                                child: DropdownButton<String>(
                                  value: state.editorTheme,
                                  isDense: true,
                                  underline: const SizedBox.shrink(),
                                  items: EditorThemes.all
                                      .map(
                                        (t) => DropdownMenuItem(
                                          value: t.name,
                                          child: Text(t.name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      context
                                          .read<SettingsCubit>()
                                          .setEditorTheme(value);
                                    }
                                  },
                                ),
                              ),
                              const Divider(),
                              _SettingsRow(
                                label: 'Auto-save drafts',
                                child: Switch(
                                  value: state.autoSave,
                                  onChanged: (value) {
                                    context
                                        .read<SettingsCubit>()
                                        .setAutoSave(enabled: value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // About section
                  _SectionHeader(title: 'About'),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _SettingsRow(
                            label: 'Version',
                            child: Text(
                              '1.0.0',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const Divider(),
                          _SettingsRow(
                            label: 'License',
                            child: Text(
                              'MIT',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
