import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/exports_for_display_widget.dart';

import '../../data/models/agent_ad_model.dart';
import '../state/agent_store.dart';
import 'agent_display_ad_dialog.dart';
import 'agent_inherit_widget.dart';

class AgentDisplayAds extends StatefulWidget {
  @override
  _AgentDisplayAdsState createState() => _AgentDisplayAdsState();
}

class _AgentDisplayAdsState extends State<AgentDisplayAds>
    with AfterLayoutMixin {
  final GlobalKey _adStreamKey = new GlobalKey(debugLabel: 'adstream');
  final GlobalKey _mergeStreamKey = new GlobalKey(debugLabel: 'mergestream');

  final List<String> tabs = [
    localeStr.agentAdTabAvailable,
    localeStr.agentAdTabGenerated,
  ];

  AgentStore _store;
  List<AgentAdModel> ads;
  List<AgentAdModel> mergeAds;
  Widget adGrid;
  Widget mergeAdGrid;

  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    _store ??= AgentStoreInheritedWidget.of(context).store;
    if (_store == null) {
      return Center(
        child: WarningDisplay(
          message:
              Failure.internal(FailureCode(type: FailureType.INHERIT)).message,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Global.device.width - 12,
              maxHeight: 36,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: RaisedButton(
                    color: (_tabIndex == index)
                        ? themeColor.buttonPrimaryColor
                        : themeColor.buttonSecondaryColor,
                    textColor: (_tabIndex == index)
                        ? themeColor.buttonTextPrimaryColor
                        : themeColor.defaultTextColor,
                    child: Text(tabs[index]),
                    onPressed: () {
                      if (_tabIndex == index) return;
                      _tabIndex = index;
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: IndexedStack(
              index: _tabIndex,
              children: <Widget>[
                /// ad data stream
                StreamBuilder<List<AgentAdModel>>(
                  key: _adStreamKey,
                  stream: _store.adStream,
                  initialData: [],
                  builder: (_, snapshot) {
                    if (snapshot != null && ads != snapshot.data) {
                      ads = snapshot.data;
                      adGrid = _buildAdGrid();
                    }
                    adGrid ??= _buildAdGrid();
                    return adGrid;
                  },
                ),

                /// merge ad data stream
                StreamBuilder<List<AgentAdModel>>(
                  key: _mergeStreamKey,
                  stream: _store.mergeAdStream,
                  initialData: [],
                  builder: (_, snapshot) {
                    if (snapshot != null && mergeAds != snapshot.data) {
                      mergeAds = snapshot.data;
                      mergeAdGrid = _buildMergeAdGrid();
                    }
                    mergeAdGrid ??= _buildMergeAdGrid();
                    return mergeAdGrid;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAdGrid() {
    if (ads == null || ads.isEmpty) return SizedBox.shrink();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        childAspectRatio: 0.6,
      ),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: ads.length,
      itemBuilder: (_, index) {
        return _buildAdItem(ads[index], false);
      },
    );
  }

  Widget _buildMergeAdGrid() {
    if (mergeAds == null || mergeAds.isEmpty) return SizedBox.shrink();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        childAspectRatio: 0.7,
      ),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: mergeAds.length,
      itemBuilder: (_, index) {
        return _buildAdItem(mergeAds[index], true);
      },
    );
  }

  Widget _buildAdItem(AgentAdModel data, bool isMerged) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(width: 8.0, color: themeColor.defaultDisabledColor),
          borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
          color: themeColor.defaultDisabledColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
        child: Column(
          children: <Widget>[
            /* Ad Image */
            networkImageBuilder(
              data.pic,
              fit: BoxFit.fill,
              roundCorner: true,
              roundParam: 16.0,
            ),
            /* Ad Text */
            if (data.content != null)
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        data.content,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => new AgentDisplayAdDialog(
          adId: data.id,
          title: data.content,
          pic: data.pic,
          isMerged: isMerged,
          onGenerate: (id) {
            _store.postAd(id);
            try {
              Future.delayed(Duration(milliseconds: 3500), () {
                if (_store.mergeAdResult.isSuccess) {
                  _tabIndex = 1;
                  setState(() {});
                }
              });
            } on Exception {}
          },
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_store != null) _store.getAds(alsoRequestMergedAds: true);
  }
}
