import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/enums/preferences_key_enum.dart';
import 'ILocaleManager.dart';

class LocaleManager implements ILocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  static LocaleManager get instance => _instance;
  SharedPreferences? _preferences;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  ///[clearAll]: cache temizler
  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  ///[getStringValue]: string value değerini getirir
  @override
  String getStringValue(PreferencesKeys key) {
    return _preferences!.getString(key.toString()) ?? '';
  }

  ///[setStringValue]: string value değerini saklar
  @override
  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }
}
