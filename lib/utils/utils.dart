import 'package:assignment/utils/SharedPrefs.dart';

void saveToSharedprefsString(String key, String value) {
  SharedPrefs.initSharedPres().then((onValue) {
    SharedPrefs.saveString(key, value);
  });
}
