import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World!'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ListTile: $index',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                OutlineButton(
                  onPressed: () {},
                  child: const Text('Button'),
                ),
              ],
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AnotherScreen(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.hot_tub_outlined,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}

class AnotherScreen extends StatefulWidget {
  @override
  _AnotherScreenState createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  bool _showModifiedContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Panel(
            index: index,
            showModifiedContainer: _showModifiedContainer,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gradient),
        onPressed: () =>
            setState(() => _showModifiedContainer = !_showModifiedContainer),
      ),
    );
  }
}

class Panel extends StatelessWidget {
  final int index;
  final bool showModifiedContainer;

  const Panel({
    @required this.index,
    @required this.showModifiedContainer,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(40.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius:
            showModifiedContainer ? BorderRadius.circular(100.0) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 6),
            blurRadius: 12.0,
          )
        ],
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1599792448678-942654a4e850?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1314&q=80',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Panel $index',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.grain,
            color: Colors.white,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
