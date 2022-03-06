import '../../constants/enums/preferences_key_enum.dart';

abstract class ILocaleManager {
  Future<void> setStringValue(PreferencesKeys key, String value);
  String getStringValue(PreferencesKeys key);
}
