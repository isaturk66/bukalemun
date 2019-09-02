import 'package:bukalemun/Constants/serverRouteConstants.dart';
import 'package:bukalemun/Model/coordinate.dart';

class SchoolModel{

 final String name,iconUrl,id;
 final Coordinate coordinate;

 const SchoolModel({
   this.id,
   this.name,
   this.iconUrl,
   this.coordinate
 });
 factory SchoolModel.fromJson(Map<String, dynamic> json){
    return SchoolModel(
      id: json['_id'],
      name: json['name'],
      coordinate: Coordinate.fromString(json['location']),
      iconUrl: filesRoute+"/schoolIcons/"+json['_id'].toString()+"/"+json['icon']+".png"
    );
  }
}