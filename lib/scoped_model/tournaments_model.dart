import 'package:assignment/podo/tournaments.dart';
import 'package:assignment/utils/base_url.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class TournamentsModel extends Model {
  Map<String, dynamic> _tournamentResponse = {};
  Tournaments tournaments;
  String _failureMessage;
  bool _isLoading = false;

  Future<Map<String, dynamic>> getTournaments() async {
    _isLoading = true;
    notifyListeners();
    return http
        .get(
      "$tournamentUrl",
    )
        .then((http.Response response) {
      _isLoading = false;
      notifyListeners();
      final int statusCode = response.statusCode;
      debugPrint('statusCode $statusCode ${json.toString()}');
      if (statusCode != 200 || json == null) {
        throw new Exception("Server Error");
      }
      _tournamentResponse = jsonDecode(response.body);

      print(
          'tournamentUrl $tournamentUrl  _tournamentResponse $_tournamentResponse');

      if (_tournamentResponse['success']) {
        tournaments = Tournaments.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        tournaments = null;
        _failureMessage = "something went wrong";
      }
      notifyListeners();
      return _tournamentResponse;
    });
  }

  List<Tournament> get getTournamentsList {
    return tournaments?.data?.tournaments;
  }

  Tournaments get getTournament {
    return tournaments;
  }

  String get getCityFaliureMessage {
    return _failureMessage;
  }

  bool get loading {
    return _isLoading;
  }
}
