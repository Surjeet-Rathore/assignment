import 'package:scoped_model/scoped_model.dart';

class LoginModel extends Model {
  bool _isButtonVisible = false;

  Future<bool> setButtonBg(bool visible) {
    if (visible)
      _isButtonVisible = true;
    else
      _isButtonVisible = false;
    notifyListeners();
  }

  bool get getButtonVisibility {
    return _isButtonVisible ?? false;
  }
}
