import 'dart:convert';

import 'package:bukalemun/Constants/serverRouteConstants.dart';
import 'package:bukalemun/Model/schoolsModel.dart';
import 'package:http/http.dart' as http ;

class Schools{
  static Future<List<SchoolModel>> getSchools() async{
    List<SchoolModel> result = new List<SchoolModel>();
    
      var response = await http.get(getSchoolsRoute);
      var shoolsraw = json.decode(response.body);
      assert(shoolsraw is List);
      shoolsraw.forEach((element) => result.add(parseSchools(element)));
      return result;
    } 

 static SchoolModel parseSchools(Map<String, dynamic> json){
    
    return SchoolModel.fromJson(json);

  }





}