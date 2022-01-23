import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/screen/teammatche.screen.dart';
import 'package:footballapp/service/football.service.dart';
import 'package:footballapp/ui/gameui.model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("FotballApp"),
            backgroundColor: Color.fromARGB(255, 46, 0, 212),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Match', icon: Icon(Icons.sports_score)),
                Tab(text: 'TEAM', icon: Icon(Icons.sports_esports)),
              ],
            ),
          ), //en tete de application
          body: TabBarView(
            children: [
              Center(
                child: FutureBuilder<List<GameUI>>(
                  future: FootballService().loadGames(),
                  builder: (context, data) {
                    if (data.hasData) {
                      var gameList = data.data!;
                      return ListView.builder(
                        itemCount: gameList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Positioned(
                                      top: 100,
                                      left: 20,
                                      child: Text(
                                        "${gameList[index].homeTeam} ",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      )),
                                  Positioned(
                                      right: 20,
                                      left: 20,
                                      child: Text(
                                        "${gameList[index].score} ",
                                        style: TextStyle(
                                          backgroundColor:
                                              Color.fromARGB(255, 66, 231, 72),
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      )),
                                  Positioned(
                                      top: 100,
                                      left: 20,
                                      child: Text(
                                        "${gameList[index].visitorTeam} ",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      )),
                                ],
                              ),
                            ), //
                          );
                        },
                      );
                    } else {
                      return LinearProgressIndicator();
                    }
                  },
                ),
              ),
              teammatch(),
            ],
          ),
        ),
      ),
    ); //code de button de refreshir
  }
}
