import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {

  double height;
  CustomAppBar({Key key, this.height}) : super(key: key);


  @override
  CustomAppBarState createState() => CustomAppBarState();
}
enum CustomAppBarMode{
  light,
  green,
}
class CustomAppBarState extends State<CustomAppBar> with SingleTickerProviderStateMixin {

  TabController tabController;

  Color customAppBarColor = Colors.white;
  CustomAppBarMode mode = CustomAppBarMode.light;

  Color lightModeColor = Colors.white;
  Color greenModeColor = Color.fromRGBO(17, 172, 83, 1);

  Image logo = new Image.asset("assets/assets/bukalemunlogo.png");

  Offset appBarOffset;


 


  void asddd(){

    setState(() {
      customAppBarColor = Colors.redAccent;
    });
  }

  void ifRelated(){
    if((tabController.animation.value - 4).abs() <= 0.5){
      if(mode != CustomAppBarMode.green){
          mode = CustomAppBarMode.green; 
          customAppBarColor = greenModeColor;
          logo = Image.asset("assets/assets/bukalemunlogoLight.png");
      }
    }else{
      if(mode != CustomAppBarMode.light){
        setState(() {
          mode = CustomAppBarMode.light; 
          customAppBarColor = lightModeColor;
          logo = Image.asset("assets/assets/bukalemunlogo.png");
        });
      }
    }
  }

  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController = DefaultTabController.of(context);
    tabController.animation.addListener(ifRelated);
    tabController.animation.addListener(() => setState(() {}));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     appBarOffset = new Offset(0, 0);
    

  }
  
  void calculateOffset(double index){
    final media = MediaQuery.of(context);
    final double yfinal = 0;
    final double yinitial = (media.padding.top+widget.height)*-1;
    double y;
    double difference = (index-2.0).abs();

    if(difference != 0){
      if(difference <= 1.0){
        double process = 1.0-(difference/1.0);
        y = process*yinitial;
          appBarOffset = new Offset(0, y);
        
      }
    }else appBarOffset = new Offset(0, yinitial);

  }

  


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final animationDuration = Duration(milliseconds: 300);
    final appBarWidth = media.size.width;
    calculateOffset(tabController.animation.value);



    
    return Transform.translate(
      offset: appBarOffset,
          child: new Column(
              
                      children: <Widget>[
                        AnimatedContainer( ///Upper padding that will
                          height: media.padding.top,
                          width: appBarWidth,
                          duration: animationDuration,
                          curve: Curves.ease,
                          color: customAppBarColor,

                        ),
                        AnimatedContainer(
                          color: customAppBarColor,
                          duration: animationDuration,
                          curve: Curves.ease,
                          height: widget.height,
                          width: appBarWidth,
                          child: Center(child: Container(
                            padding: EdgeInsets.all(8),
                            child: logo,
                          ),),
                        ),
                      ]
      ),
    );
  }
}
