export 'marquee_slide.dart';
export 'marquee_slide_direction.dart';

/// From Dependency
/// flutter_marquee:
///   git: https://github.com/LiuC520/flutter_marquee.git
///
/// sample code:
///
/// Column(
///   children: <Widget>[
///     Column(
///       children: <Widget>[
///         Text("從下到上,時間間隔6秒，傳入的是字串陣列"),
///         Container(
///           margin: EdgeInsets.all(4),
///           height: 60,
///           width: 200,
///           decoration: BoxDecoration(
///               border: Border.all(width: 2, color: Colors.red),
///               borderRadius: BorderRadius.all(Radius.circular(8))),
///           child: FlutterMarquee(
///               texts: ["劉成", "劉成1111", "劉成2222", "劉成3333"].toList(),
///               onChange: (i) {
///                 print(i);
///               },
///               duration: 4),
///         )
///       ],
///     ),
///     Column(
///       children: <Widget>[
///         Text("從上到下,時間間隔8秒,傳入的是自定義的text widget"),
///         Container(
///           margin: EdgeInsets.all(4),
///           height: 60,
///           width: 200,
///           decoration: BoxDecoration(
///               border: Border.all(width: 2, color: Colors.red),
///               borderRadius: BorderRadius.all(Radius.circular(8))),
///           child: FlutterMarquee(
///               children: <Widget>[
///                 Text(
///                   "劉成",
///                   style: TextStyle(color: Colors.red),
///                 ),
///                 Text("劉成1111", style: TextStyle(color: Colors.green)),
///                 Text("劉成2222", style: TextStyle(color: Colors.blue)),
///                 Text("劉成3333",
///                     style: TextStyle(color: Colors.yellow)),
///               ],
///               onChange: (i) {
///                 print(i);
///               },
///               animationDirection: AnimationDirection.t2b,
///               duration: 8),
///         )
///       ],
///     ),
///     Column(
///       children: <Widget>[
///         Text("從左到右,時間間隔2秒,自定義的view"),
///         Container(
///           margin: EdgeInsets.all(4),
///           height: 60,
///           width: 200,
///           decoration: BoxDecoration(
///               border: Border.all(width: 2, color: Colors.red),
///               borderRadius: BorderRadius.all(Radius.circular(8))),
///           child: FlutterMarquee(
///               children: <Widget>[
///                 Center(
///                   child: Row(
///                     children: <Widget>[
///                       Icon(Icons.menu),
///                       Text(
///                         "劉成",
///                         style: TextStyle(color: Colors.green),
///                       ),
///                     ],
///                   ),
///                 ),
///                 Center(
///                   child: Row(
///                     children: <Widget>[
///                       Icon(Icons.add),
///                       Text(
///                         "劉成1111",
///                         style: TextStyle(color: Colors.red),
///                       ),
///                     ],
///                   ),
///                 ),
///                 Center(
///                   child: Row(
///                     children: <Widget>[
///                       Icon(Icons.satellite),
///                       Text(
///                         "劉成2222",
///                         style: TextStyle(color: Colors.blue),
///                       ),
///                     ],
///                   ),
///                 ),
///                 Center(
///                   child: Row(
///                     children: <Widget>[
///                       Icon(Icons.format_align_justify),
///                       Text("劉成3333",
///                           style: TextStyle(color: Colors.yellow)),
///                     ],
///                   ),
///                 ),
///               ],
///               onChange: (i) {
///                 print(i);
///               },
///               animationDirection: AnimationDirection.l2r,
///               duration: 2),
///         )
///       ],
///     ),
///     Column(
///       children: <Widget>[
///         Text("從右到左,時間間隔6秒"),
///         Container(
///           margin: EdgeInsets.all(4),
///           height: 60,
///           width: 200,
///           decoration: BoxDecoration(
///               border: Border.all(width: 2, color: Colors.red),
///               borderRadius: BorderRadius.all(Radius.circular(8))),
///           child: FlutterMarquee(
///               texts: ["Marquee", "Marquee1111", "Marquee2222", "Marquee3333"].toList(),
///               onChange: (i) {
///                 print(i);
///               },
///               animationDirection: AnimationDirection.r2l,
///               duration: 6),
///         )
///       ],
///     ),
///
