import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scroll From Bottom to Top',
      home: ScrollBottomToTopScreen(),
    );
  }
}

class ScrollBottomToTopScreen extends StatefulWidget {
  @override
  _ScrollBottomToTopScreenState createState() =>
      _ScrollBottomToTopScreenState();
}

class _ScrollBottomToTopScreenState extends State<ScrollBottomToTopScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(1000, (index) => 'Item ${index + 1}');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Scroll From Bottom to Top'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: scrollToTop,
          child: const Icon(Icons.arrow_upward),
        ));
  }
}
