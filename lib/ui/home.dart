import 'package:assignment/Theme/Color.dart';
import 'package:assignment/inherited_widget/app_inherited_widget.dart';
import 'package:assignment/podo/tournaments.dart';
import 'package:assignment/scoped_model/app_model.dart';
import 'package:assignment/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppModel appModel;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    appModel = InjectInheritedWidget.of(context).appModel;
    return Scaffold(body: SafeArea(
      child: ScopedModel<AppModel>(
        model: appModel,
              child: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
          return !appModel.loading && appModel.getTournament != null
              ? Container(
                  child: ListView.builder(
                      itemCount: appModel.getTournamentsList.length,
                      itemBuilder: (context, position) {
                        return buildRoundShapeCardWidget(
                            child: _buildChildLayout(
                                appModel.getTournamentsList[position]),
                            color: Colors.white,
                            height: 140,
                            radius: 20,
                          );
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    ));
  }

  void _checkInternet() {
    appModel.isInternetConnected().then((value) {
      if (value)
        _tournamentApi();
      else
        toast("No internet");
    });
  }

  void _tournamentApi() async {
    appModel.getTournaments();
  }

  _buildChildLayout(Tournament tournamentsList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            fit: BoxFit.cover,
            height: 70,
            width: MediaQuery.of(context).size.width,
            image: tournamentsList.coverUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
                      buildSpaceWidget(height: 5.0),
          buildBoldTextWidget(text: tournamentsList.tournamentType,fontSize: normalText),
          buildSpaceWidget(height: 5.0),
          buildTextWidget(text: tournamentsList.adminUsername,fontSize: normalText)
            ],
          ),
        )
      ],
    );
  }
}
