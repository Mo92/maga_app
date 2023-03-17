import 'package:flutter/material.dart';

/// Wrapper for page contet
/// `body` represents the Page content
class DefaultPage extends StatelessWidget {
  final Widget body;
  final bool hasSearchBar;
  final AppBar? appBar;
  const DefaultPage({
    super.key,
    required this.body,
    this.hasSearchBar = true,
    this.appBar,
  }) : assert(
            hasSearchBar == false || appBar == null,
            'Cannot provide both a searchBar and an Appbar\n'
            'If you are using a custom AppBar, ensure that `hasSearchBar` is explicit set `false`');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasSearchBar
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(0, 2.2),
                      blurRadius: 12,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 34, right: 34, bottom: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text(
                          // TODO(Mo): add translation
                          'Restaurant suchen...',
                          textAlign: TextAlign.center,
                        ),
                        fillColor: Colors.white70,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        isDense: true,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: body,
    );
  }
}
