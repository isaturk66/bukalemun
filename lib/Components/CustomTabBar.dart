import 'package:bukalemun/Components/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;


class CustomTabBar extends StatefulWidget {
  final double widgetHeight;

  CustomTabBar(this.widgetHeight);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  /// Diameter of the blank circle(Imaginery)
  ///while changing do not forget to change the diameter variable inside the [TabBarPainter]
  static double diameter = 80;

  /// 80 by default
  static double radius = diameter / 2;
  double topspace = 4;

  double index = 2;
  TabController tabController;

  Offset tabBarOffset = new Offset(0, 0);


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabController = DefaultTabController.of(context);
    tabController.animation.addListener(() => setState(() {}));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final double yinitial = (MediaQuery.of(context).padding.top+widget.widgetHeight);
    // tabBarOffset = new Offset(0, yinitial);

  }
   void calculateOffset(double index){
    final media = MediaQuery.of(context);
    final double yfinal = 0;
    final double yinitial = (media.padding.top+widget.widgetHeight)+10;
    double y;
    double difference = (index-2.0).abs();

    if(difference != 0){
      if(difference <= 1.0){
        double process = 1.0-(difference/1.0);
        y = process*yinitial;
          tabBarOffset = new Offset(0, y);
        
      }
    }else tabBarOffset = new Offset(0, yinitial);
  
  }

  Widget ActiveLayer() {
    final media = MediaQuery.of(context);
    diameter = media.size.width / 5;

    return Transform.translate(
        offset: tabBarOffset,
        child: Container(
        child: new Stack(
          children: <Widget>[
            CustomShape(diameter),

            /// Left Element holder containing two touchable elements
            Positioned(
              bottom: 5,
              left: 5,
              child: new Container(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 10,
                      ),
                      Container(
                        width: 65,
                        child: TouchableElement(
                          diameter: diameter,
                          widgetHeight: widget.widgetHeight,
                          path:"assets/assets/forum.png",
                          pathHighlighted:"assets/assets/forumHighlighted.png",
                          elementIndex: 0,
                          tabController: tabController,
                        ),
                      ),
                      new Container(
                        width: 15,
                      ),
                      Container(
                        width: 65,
                        child: TouchableElement(
                          diameter: diameter,
                          widgetHeight: widget.widgetHeight,
                          path: "assets/assets/safari.png",
                          pathHighlighted:"assets/assets/safariHighlighted.png",
                          elementIndex: 1,
                          tabController: tabController,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),

            /// Right Element holder containing two touchable elements
            Positioned(
              bottom: 5,
              right: 5,
              child: new Container(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Container(
                        width: 65,
                        child: TouchableElement(
                          diameter: diameter,
                          widgetHeight: widget.widgetHeight,
                          path:"assets/assets/conference.png",
                          pathHighlighted:"assets/assets/conferenceHighlighted.png",
                          elementIndex: 3,
                          tabController: tabController,
                        ),
                      ),
                      new Container(
                        width: 15,
                      ),
                      Container(
                        height: 60,
                        child: TouchableElement(
                          diameter: diameter,
                          widgetHeight: widget.widgetHeight,
                          path: "assets/assets/profile.png",
                          pathHighlighted: "assets/assets/profileHighlighted.png",
                          elementIndex: 4,
                          tabController: tabController,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget SphereButton(var diametere) {
    final media = MediaQuery.of(context);
    var radiuse = diametere / 2;
    int elementIndex = 2;

    ///Current index of the touchable since this is midddle button value is 2

    Color highlightedColor = Color.fromRGBO(17, 172, 83, 1);
    Color neutralColor = Color.fromRGBO(112, 112, 112, 1);

    _renderColor() {
      if((tabController.animation.value -elementIndex.toDouble()).abs() < 0.5 ){
        return highlightedColor;
      }else if(tabController.animation.value == 0.5 && elementIndex == tabController.previousIndex){
        return highlightedColor;
      }else return neutralColor;
    }

    _handleTap() {
      tabController.animateTo(elementIndex);
    }

    return Positioned(
      left: (media.size.width - diametere) / 2 + 5,
      bottom: widget.widgetHeight - (radiuse + topspace) + 5,
      child: GestureDetector(
        onTap: () => _handleTap(),
        child: new Container(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset("assets/assets/Asset 6.png")),
          height: diameter - 10,
          width: diameter - 10,
          decoration: BoxDecoration(
              color: _renderColor(), borderRadius: BorderRadius.circular(70)),
        ),
      ),
    );
  }

  Widget CustomShape(var diameter) {
    final media = MediaQuery.of(context);

    radius = diameter / 2;
    return Container(
      height: widget.widgetHeight + diameter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: widget.widgetHeight,
            width: media.size.width,
            child: CustomPaint(
              painter: diameter == null
                  ? TabBarPainter()
                  : TabBarPainter(diameter: diameter, topSpace: topspace),
            ),
          ),
          SphereButton(diameter),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    calculateOffset(tabController.animation.value);


    return ActiveLayer();
  }
}

enum ElementMode {
  netural,
  highlighted,
}

const Duration pushDelay = Duration(milliseconds: 300);

class TouchableElement extends StatelessWidget {
  final double diameter;
  final double widgetHeight;
  final String path, pathHighlighted;
 
  final int elementIndex;
  final TabController tabController;
  TouchableElement({
    @required this.diameter,
    @required this.widgetHeight,
    @required this.path,
    @required this.pathHighlighted,
    @required this.elementIndex,
    @required this.tabController
    });

  var mode = ElementMode.netural;


  Widget buildImage() {
     if((tabController.animation.value -elementIndex.toDouble()).abs() < 0.5 ){
        return new Image.asset(pathHighlighted);
      }else if(tabController.animation.value == 0.5 && elementIndex == tabController.previousIndex){
        return Image.asset(pathHighlighted);
      }else return Image.asset(path);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final elementWidth = (((media.size.width - diameter) / 2) - 15) / 2;
    final elemenetHeight = widgetHeight - 10;



    return  new GestureDetector(
        onTap: () {
          tabController.animateTo(elementIndex);
        },
        child: new Container(
          key: UniqueKey(),
          width: elementWidth,
          height: elemenetHeight,
          child: Container(
              padding: EdgeInsets.all(10),
              child: buildImage(),
          ),
        )
      
    );
  }
}

class TabBarPainter extends CustomPainter {
  final Color paintColor = Colors.white;
  final Color shadowColor = Colors.black.withOpacity(0.15);

  /// X value is the diameter(R) of the deleter circle;
  /// 80 by default
  final double diameter;
  final double topSpace;

  TabBarPainter({this.diameter = 80, this.topSpace = 4});

  @override
  void paint(Canvas canvas, Size size) {
    double startCurve = (size.width - diameter) / 2;

    /// Start point of the curve
    double endCurve = startCurve + diameter; // End Point of the curve

    double xValueInset = diameter * 0.05;
    double yValueOffset = (diameter / 2) * 4.0 / 3.0;

    Path path = Path();
    Path shadowPath = Path();

    Paint paint = Paint();
    Paint shadowPaint = Paint();

    /// Point to make a semicircle approximation using Bezier Curve
    var firstendPoint = new Offset(endCurve, topSpace);
    var controlPoint1 =
        new Offset(startCurve + xValueInset, yValueOffset + topSpace);
    var controlPoint2 = new Offset(
        (diameter - xValueInset) + startCurve, yValueOffset + topSpace);

    var shadowfirstendPoint = new Offset(endCurve - topSpace, 0.0);
    var shadowcontrolPoint1 =
        new Offset(startCurve + xValueInset + topSpace, yValueOffset);
    var shadowcontrolPoint2 = new Offset(
        (diameter - xValueInset) + startCurve - topSpace, yValueOffset);

    //! Start sketching Shape
    path.moveTo(0.0, topSpace);
    path.lineTo(startCurve, topSpace);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, firstendPoint.dx, firstendPoint.dy);
    path.lineTo(size.width, topSpace);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    //! End sketching Shape

    //! Start sketching Shadow

    shadowPath.lineTo(startCurve + topSpace, 0.0);
    shadowPath.cubicTo(
        shadowcontrolPoint1.dx,
        shadowcontrolPoint1.dy,
        shadowcontrolPoint2.dx,
        shadowcontrolPoint2.dy,
        shadowfirstendPoint.dx,
        shadowfirstendPoint.dy);
    shadowPath.lineTo(size.width, 0.0);
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(0.0, size.height);
    shadowPath.close();

    //! End Sketching Shadow
    paint.color = paintColor;
    shadowPaint.color = shadowColor;

    canvas.drawShadow(shadowPath, Colors.black, 2.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TabBarPainter oldDelegate) => oldDelegate != this;
}
