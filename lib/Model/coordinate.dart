class Coordinate{
  final double lat,long;
  const Coordinate(this.lat,this.long);
  
   factory Coordinate.fromString(String data){
     var parsedlist = data.split(",");
     return Coordinate(
      double.parse(parsedlist[0]),
      double.parse(parsedlist[1]),
     );
   }
}