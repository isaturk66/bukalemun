import 'package:bukalemun/Constants/serverRouteConstants.dart';
import 'package:http/http.dart' as http ;


class Auth{
  static Future<http.Response> login({var email,var password}) async{
    var response = await http.post(loginRoute,body: {'password': password, 'email': email});
    print(response.body);
    return response;
  } 

  static Future<int> register({var username,var password,var email,var fullname,var school}) async{
    var response = await http.post(registerRoute, body: {'userName': username, 'password' : password,'email': email,'fullName' : fullname,'school':  school});
    return response.statusCode;
  }
}
