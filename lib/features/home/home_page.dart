import 'package:devlearn/component/default_body_component.dart';
import 'package:devlearn/component/error_component.dart';
import 'package:devlearn/core/extension/context_extension.dart';
import 'package:devlearn/core/extension/state_extension.dart';
import 'package:devlearn/core/provider/dependency_provider.dart';
import 'package:devlearn/core/provider/navigator_provider.dart';
import 'package:devlearn/features/home/component/learn_component.dart';
import 'package:devlearn/features/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = DependencyProvider.get();
  final String _title = 'DevLearn';

  @override
  void initState() {
    super.initState();
    onInitializedAsync(() async {
      _controller = context.watchContext();
      await _controller.init();
    });
  }

  void onClickSettings() {
    NavigatorProvider.pushNamed('/settings/');
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [
          IconButton(
            onPressed: onClickSettings,
            icon: Icon(Icons.menu_outlined),
          ),
        ],
      ),
      body: DefaultBodyComponent(
        children: [
          Visibility(
            visible: _controller.value.error.isNotEmpty,
            child: Column(
              children: [
                ErrorComponent(value: _controller.value.error),
                FilledButton(
                  onPressed: _controller.init,
                  child: Text('Tentar novamente'),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controller.groups.length,
            itemBuilder: (BuildContext context, int index) {
              var group = _controller.groups[index];
              var learns = _controller.learns.where(
                (x) => x.category == group.toLowerCase(),
              );
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(group, style: TextStyle(fontSize: 24)),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: learns.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 8);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      var item = learns.elementAt(index);
                      return LearnComponent(learnModel: item);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
