import 'package:dataclass/dataclass.dart';

part 'template_model.g.dart';

@dataClass
class TemplateModel {
  final String vip1;
  final String vip2;
  final String vip3;
  final String vip4;
  final String vip5;
  final String vip6;

  TemplateModel(
      {this.vip1, this.vip2, this.vip3, this.vip4, this.vip5, this.vip6});

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      vip1: json['1'],
      vip2: json['2'],
      vip3: json['3'],
      vip4: json['4'],
      vip5: json['5'],
      vip6: json['6'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.vip1;
    data['2'] = this.vip2;
    data['3'] = this.vip3;
    data['4'] = this.vip4;
    data['5'] = this.vip5;
    data['6'] = this.vip6;
    return data;
  }

  static TemplateModel jsonToModel(Map<String, dynamic> jsonMap) =>
      TemplateModel.fromJson(jsonMap);
}
