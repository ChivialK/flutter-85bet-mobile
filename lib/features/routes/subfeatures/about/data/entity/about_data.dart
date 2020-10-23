import 'package:dataclass/dataclass.dart';

part 'about_data.g.dart';

@dataClass
class AboutData extends _$AboutData {
  final String title;
  final List<String> subtitles;
  final List<String> contents;

  const AboutData({this.title, this.subtitles, this.contents});
}
