import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/global.dart';

import 'general/widgets/marquee_span_widget.dart';

class TestAreaRoute extends StatefulWidget {
  @override
  _TestAreaRouteState createState() => _TestAreaRouteState();
}

class _TestAreaRouteState extends State<TestAreaRoute> with AfterLayoutMixin {
  List<String> texts;

  @override
  void initState() {
    texts = [
      "网曝杨紫邓伦热恋 | 元宵节诗词 | 身份证异地能补办吗 0",
      "两限房是什么意思 | 公务员可以考研吗 1",
      "喻恩泰喊话王景春 | 云南结婚吹唢呐视频 | 汉服下裙穿法 | 一元等于多少日元 2",
      "网曝杨紫邓伦热恋 | 元宵节诗词 | 身份证异地能补办吗 | 喻恩泰喊话王景春 | 两限房是什么意思 | 公务员可以考研吗 | 云南结婚吹唢呐视频 | 汉服下裙穿法 | 一元等于多少日元 3"
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Global.device.featureContentHeight,
      width: Global.device.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // MarqueeSpan(
          //   spanTexts: [
          //     TextSpan(text: texts[0]),
          //     TextSpan(text: texts[1]),
          //     TextSpan(
          //       text: texts[2],
          //       recognizer: TapGestureRecognizer()
          //         ..onTap = () {
          //           print('Gesture Tap');
          //         },
          //     ),
          //   ],
          //   style: TextStyle(color: Colors.black),
          // ),
          // MarqueeSpan3(
          //   text: texts[3],
          //   style: TextStyle(color: Colors.black),
          // ),
          MarqueeSpan(
            texts: texts.take(3).toList(),
            spaceBetweenTexts: 60,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    debugPrint('after first layout');
  }
}
