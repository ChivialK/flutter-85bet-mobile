// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_data.dart';

// **************************************************************************
// DataClassGenerator
// **************************************************************************

abstract class _$AboutData {
  const _$AboutData();

  String get title;
  List<String> get subtitles;
  List<String> get contents;
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! AboutData) return false;
    return true &&
        this.title == other.title &&
        this.subtitles == other.subtitles &&
        this.contents == other.contents;
  }

  int get hashCode {
    return mapPropsToHashCode([title, subtitles, contents]);
  }

  String toString() {
    return 'AboutData <\'title\': ${this.title},\'subtitles\': ${this.subtitles},\'contents\': ${this.contents},>';
  }

  AboutData copyWith(
      {String title, List<String> subtitles, List<String> contents}) {
    return AboutData(
      title: title ?? this.title,
      subtitles: subtitles ?? this.subtitles,
      contents: contents ?? this.contents,
    );
  }
}
