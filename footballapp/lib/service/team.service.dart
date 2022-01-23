import 'dart:convert';
import 'dart:io';
import 'package:footballapp/model/team.model.dart';

import 'package:footballapp/ui/teamui.model.dart';
import 'package:http/http.dart' as http;

class TeamService {
  Future<List<TeamUI>> loadGames() async {
    var _uri = Uri.https('www.mocky.io', 'v2/5de8d40d31000074006b1487');
    var response = await http.Client().get(_uri);
    List<TeamUI> games = List.empty(growable: true);
    if (response.statusCode == HttpStatus.ok) {
      var listTeam = Team.fromJson(jsonDecode(response.body));
      listTeam.data?.forEach((element) {
        games.add(
          TeamUI(
            abbreviation: element.abbreviation!,
            division: element.division!,
            conference: element.conference!,
            city: element.city!,
            full_name: element.fullName!,
            name: element.name!,
          ),
        );
      });
    }
    return games;
  }
}
