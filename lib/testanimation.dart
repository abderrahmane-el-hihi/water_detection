import 'package:flutter/material.dart';
//import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WaterDrop extends StatelessWidget {
  const WaterDrop({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //         child: Center(
    //             child: LiquidCircularProgressIndicator(
    //       value: 0.3,
    //       backgroundColor: Colors.white,
    //       valueColor: AlwaysStoppedAnimation(Colors.blue),
    //       borderColor: Colors.grey,
    //       borderWidth: 1.0,
    //       direction: Axis.vertical,
    //       center: Text(
    //         '50%',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //     ))),
    //   ),
    // );
    //what Im using
    return Scaffold(
      body: Center(
        child: Container(
          height: 150.0,
          width: 150.0,
          //lequid custom progress for test
          // child: LiquidCustomProgressIndicator(
          //   value: 0.5,
          //   direction: Axis.vertical,
          //   shapePath: _buildCylinderPath(),
          //   //shapePath: _buildTearPath(),
          //   center: Text('50%'),
          // ),
        ),
      ),
    );
  }
}

Path _buildCylinderPath() {
  final Path path = Path();
  path.moveTo(20, 0);
  path.lineTo(20, 100);
  path.arcToPoint(
    Offset(130, 100),
    radius: Radius.circular(20.0),
    clockwise: false,
  );
  path.lineTo(130, 0);
  path.arcToPoint(
    Offset(20, 0),
    radius: Radius.circular(20.0),
    clockwise: false,
  );
  return path;
}
