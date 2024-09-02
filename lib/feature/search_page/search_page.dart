import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
final class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Search page")),
    );
  }
}
