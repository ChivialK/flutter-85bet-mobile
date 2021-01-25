import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter/foundation.dart';
import 'package:source_gen/source_gen.dart';

import 'parser/code_generate.dart';
import 'parser/member_collect.dart';
import 'to_string.dart';

Builder toString(BuilderOptions options) => SharedPartBuilder([
      ToStringGenerator(
        prettyPrint: options.config["prettyPrint"] ?? false,
        indent: options.config["indent"],
      )
    ], 'to_string');

class ToStringGenerator extends GeneratorForAnnotation<ToString> {
  const ToStringGenerator({
    this.prettyPrint,
    this.indent,
  });

  final bool prettyPrint;
  final String indent;

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final clazz = element;

    if (!(element is ClassElement)) {
      debugPrint("Only supports class element");
      return null;
    }

    return generateToStringMethod(
        clazz,
        collectClassMemberToString(clazz),
        Config(
          prettyPrint: annotation.peek("prettyPrint")?.boolValue ?? prettyPrint,
          indent: annotation.peek("indent")?.stringValue ?? indent,
        ));
  }
}
