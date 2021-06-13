import 'package:connectivity/connectivity.dart';
import 'package:scoped_model/scoped_model.dart';

class NetworkModel extends Model
{
    Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      notifyListeners();
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
