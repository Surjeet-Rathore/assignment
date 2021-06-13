import 'package:assignment/scoped_model/login_model.dart';
import 'package:assignment/scoped_model/network_model.dart';
import 'package:assignment/scoped_model/tournaments_model.dart';
import 'package:scoped_model/scoped_model.dart';


class AppModel extends Model with TournamentsModel,NetworkModel,LoginModel{}
//mixing scpoed model inherted widget
