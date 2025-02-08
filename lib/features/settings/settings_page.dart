import 'package:devlearn/component/default_body_component.dart';
import 'package:devlearn/core/tool/url.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: DefaultBodyComponent(
        children: [
          ListTile(
            onTap: () => Url.openUrl(
              'https://github.com/NetoBatista/devlearn/blob/main/assets/privacy.md',
            ),
            title: Text('Privacidade'),
            trailing: Icon(Icons.chevron_right_outlined),
          ),
          ListTile(
            onTap: () => Url.openUrl(
              'https://github.com/NetoBatista/devlearn/blob/main/assets/use_term.md',
            ),
            title: Text('Termo de uso'),
            trailing: Icon(Icons.chevron_right_outlined),
          ),
        ],
      ),
    );
  }
}
