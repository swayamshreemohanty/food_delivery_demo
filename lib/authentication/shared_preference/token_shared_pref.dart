import 'dart:convert';
import 'package:food_delivery/authentication/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPref {
  //TokenSharedPreference keys
  final String _token = 'Token';
  final String _key = 'FoodDeliveryUserToken';

  Future<void> storeToken(TokenData incomingtokenData) async {
    final tokenPath = await SharedPreferences.getInstance();
    var encodedData = jsonEncode({
      _token: incomingtokenData.token,
    });
    await tokenPath.setString(_key, encodedData);
  }

  Future<TokenData> fetchStoredToken() async {
    final tokenPath = await SharedPreferences.getInstance();

    if (!tokenPath.containsKey(_key)) {
      return TokenData(token: null);
    }
    final extractedUserToken =
        json.decode(tokenPath.getString(_key)!) as Map<String, dynamic>;
    var tokenData = TokenData(
      token: extractedUserToken[_token],
    );
    return tokenData;
  }

  Future<void> deleteToken() async {
    final tokenPath = await SharedPreferences.getInstance();
    //Clear the whole shared preference including token and stripe credentials
    tokenPath.clear();
  }

  Future<bool> hasToken() async {
    final hasToken = await fetchStoredToken();
    if (hasToken.token == null) {
      return false;
    } else {
      return true;
    }
  }
}
