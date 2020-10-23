import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_85bet_mobile/features/export_internal_file.dart';
import 'package:flutter_85bet_mobile/features/router/app_navigate.dart';
import 'package:flutter_85bet_mobile/features/routes/subfeatures/about/data/entity/about_data.dart';
import 'package:flutter_85bet_mobile/res.dart';

class AboutRoute extends StatelessWidget {
  final AboutData data1 =
      AboutData(title: localeStr.aboutDataTitle1, contents: [
    localeStr.aboutDataDesc10,
    localeStr.aboutDataDesc11,
    localeStr.aboutDataDesc12,
  ]);

  final AboutData data2 =
      AboutData(title: localeStr.aboutDataTitle2, subtitles: [
    localeStr.aboutDataSubtitle20,
    localeStr.aboutDataSubtitle21,
    localeStr.aboutDataSubtitle22,
    localeStr.aboutDataSubtitle23,
  ], contents: [
    localeStr.aboutDataDesc20,
    localeStr.aboutDataDesc21,
    localeStr.aboutDataDesc22,
    localeStr.aboutDataDesc23,
  ]);

  final AboutData data3 =
      AboutData(title: localeStr.aboutDataTitle3, subtitles: [
    localeStr.aboutDataSubtitle30,
    localeStr.aboutDataSubtitle31,
    localeStr.aboutDataSubtitle32,
  ], contents: [
    localeStr.aboutDataDesc30,
    localeStr.aboutDataDesc31,
    localeStr.aboutDataDesc32,
  ]);

  final AboutData data4 =
      AboutData(title: localeStr.aboutDataTitle4, subtitles: [
    localeStr.aboutDataSubtitle40,
    localeStr.aboutDataSubtitle41,
    localeStr.aboutDataSubtitle42,
    localeStr.aboutDataSubtitle43,
  ], contents: [
    localeStr.aboutDataDesc40,
    localeStr.aboutDataDesc41,
    localeStr.aboutDataDesc42,
    localeStr.aboutDataDesc43,
  ]);

  final AboutData data5 =
      AboutData(title: localeStr.aboutDataTitle5, subtitles: [
    localeStr.aboutDataSubtitle50,
    localeStr.aboutDataSubtitle51,
    localeStr.aboutDataSubtitle52,
    localeStr.aboutDataSubtitle53,
  ], contents: [
    localeStr.aboutDataDesc50,
    localeStr.aboutDataDesc51,
    localeStr.aboutDataDesc52,
    localeStr.aboutDataDesc53,
  ]);

  final List<String> _certImages = [
    Res.certGc,
    Res.certMga,
    Res.certPagcor,
    Res.certBvi,
  ];

  final List<String> _certLabel = [
    localeStr.aboutCertTitleGC,
    localeStr.aboutCertTitleMGA,
    localeStr.aboutCertTitlePGC,
    localeStr.aboutCertTitleBVI,
  ];

  final List<String> _teamsImages = [
    Res.teamsMcu,
    Res.teamsFra1,
    Res.teamsFcb,
    Res.teamsLcc,
    Res.teamsAfa,
//    Res.teamsIta1,
    Res.teamsHbsc,
  ];

  @override
  Widget build(BuildContext context) {
    List<AboutData> _dataList = [
      data1,
      data2,
      data3,
      data4,
      data5,
    ];

    Widget _certGrid = _buildCertGrid();
    Widget _badgeGrid = _buildBadgeGrid();

    return WillPopScope(
      onWillPop: () async {
        debugPrint('pop about route');
        Future.delayed(
            Duration(milliseconds: 100), () => RouterNavigate.navigateBack());
        return Future(() => true);
      },
      child: Scaffold(
        body: Container(
            height: Global.device.featureContentHeight,
            width: Global.device.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Res.wallpaper), fit: BoxFit.fill)),
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView(
              primary: true,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 20.0, 4.0, 12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Themes.memberIconColor,
                          boxShadow: Themes.roundIconShadow,
                        ),
                        child: SizedBox(
                            width: 32 * Global.device.widthScale,
                            height: 32 * Global.device.widthScale,
                            child: Image.asset(Res.iconAbout,
                                color: Themes.iconColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: RichText(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: localeStr.aboutDataTitle1,
                            style: TextStyle(
                                fontSize: FontSize.HEADER.value,
                                color: Themes.defaultTextColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListView.separated(
                      primary: false,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (context, _) {
                        // add divider between options
                        return SizedBox(height: 16.0);
                      },
                      itemBuilder: (content, index) {
                        final data = _dataList[index];
                        if (index == 0) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                color: Themes.defaultLayerBackgroundColor,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: FontSize.SUBTITLE.value,
                                    color: Themes.defaultMessageColor),
                                children: [
                                  TextSpan(text: data.contents[0]),
                                  WidgetSpan(child: _certGrid),
                                  TextSpan(text: data.contents[1]),
                                  TextSpan(text: data.contents[2]),
                                  WidgetSpan(
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 12.0, 12.0, 0),
                                          child: _badgeGrid)),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 0.0),
                              decoration: BoxDecoration(
                                  color: Themes.defaultLayerBackgroundColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Column(
                                children: [
                                      Text(data.title,
                                          style: TextStyle(
                                            fontSize: FontSize.TITLE.value,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Divider(height: 8.0),
                                      SizedBox(height: 16.0),
                                    ] +
                                    List.generate(
                                        data.subtitles.length,
                                        (contentIndex) =>
                                            _buildContent(data, contentIndex)),
                              ));
                        }
                      }),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildCertGrid() {
    double sizeWidth = Global.device.width / 3;
    double sizeHeight = sizeWidth - FontSize.SUBTITLE.value * 3.5;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GridView.count(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        children: _certImages
            .map((path) => (path.isEmpty)
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: sizeWidth,
                              height: sizeHeight,
                              child: Image.asset(path))),
                      RichText(
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: _certLabel[_certImages.indexOf(path)],
                          style: TextStyle(
                              fontSize: FontSize.SUBTITLE.value,
                              color: Themes.defaultTextColor),
                        ),
                      ),
                    ],
                  ))
            .toList(),
      ),
    );
  }

  Widget _buildBadgeGrid() {
    return Column(
      children: [
        Text('giấy phép',
            style: TextStyle(
              fontSize: FontSize.TITLE.value,
              fontWeight: FontWeight.bold,
            )),
        Divider(height: 8.0),
        GridView.count(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          shrinkWrap: true,
          children: _teamsImages
              .map((path) => (path.isEmpty)
                  ? SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(path),
                      ),
                    ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildContent(AboutData data, int index) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${data.subtitles[index]}\n',
            style: TextStyle(
                fontSize: FontSize.MESSAGE.value,
                fontWeight: FontWeight.bold,
                color: Themes.defaultTextColor),
          ),
          TextSpan(
            text: '${data.contents[index]}\n\n',
            style: TextStyle(
                fontSize: FontSize.SUBTITLE.value,
                color: Themes.defaultMessageColor),
          ),
        ],
      ),
    );
  }
}
