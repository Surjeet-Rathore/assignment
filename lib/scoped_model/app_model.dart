import 'package:assignment/scoped_model/network_model.dart';
import 'package:assignment/scoped_model/tournaments_model.dart';
import 'package:scoped_model/scoped_model.dart';


class AppModel extends Model with TournamentsModel,NetworkModel{}
//mixing scpoed model inherted widget
