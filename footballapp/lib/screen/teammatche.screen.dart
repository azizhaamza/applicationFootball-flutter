import 'package:flutter/material.dart';

import '../service/Team.service.dart';
import '../ui/teamui.model.dart';

class teammatch extends StatefulWidget {
  @override
  State<teammatch> createState() => _teammatch();
}

class _teammatch extends State<teammatch> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<TeamUI>>(
          future: TeamService().loadGames(),
          builder: (context, data) {
            if (data.hasData) {
              var teamList = data.data!;
              return ListView.builder(
                itemCount: teamList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Row(
                        children: [
                          Positioned(
                              child: Text(
                            "${teamList[index].full_name}(${(teamList[index].abbreviation)}) ",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                          Positioned(
                              child: Text(
                            "${teamList[index].city} ",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          )),
                          Positioned(
                              top: 100,
                              left: 20,
                              child: Text(
                                "${teamList[index].division} ",
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
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
