import 'package:flutter/material.dart';
import 'package:maga_app/app/shared/ui/default_page.dart';
import 'package:maga_app/mage_theme.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Page Content',
                style: Theme.of(context).textTheme.title,
              )
            ],
          ),
        ),
      ),
    );
  }
}
