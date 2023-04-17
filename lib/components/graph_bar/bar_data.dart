import 'package:waterdetection/components/graph_bar/indiv_bar.dart';

class BarData {
  final int MonWater;
  final int TueWater;
  final int WedWater;
  final int ThuWater;
  final int FriWater;
  final int SatWater;
  final int SunWater;
  BarData(
      {required this.MonWater,
      required this.TueWater,
      required this.WedWater,
      required this.ThuWater,
      required this.FriWater,
      required this.SatWater,
      required this.SunWater});
  List<Indiv_Bar> data_bar = [];

  void Init_BarData() {
    data_bar = [
      Indiv_Bar(x: 0, y: MonWater),
      Indiv_Bar(x: 1, y: TueWater),
      Indiv_Bar(x: 2, y: WedWater),
      Indiv_Bar(x: 3, y: ThuWater),
      Indiv_Bar(x: 4, y: FriWater),
      Indiv_Bar(x: 5, y: SatWater),
      Indiv_Bar(x: 6, y: SunWater),
    ];
  }
}
