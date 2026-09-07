import 'package:hive_ce/hive.dart';

import 'source.dart';
part 'source_response.g.dart';
@HiveType(typeId: 1)
class SourceResponse extends HiveObject {
  SourceResponse({this.status, this.sources, this.message, this.code});

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<Source>? sources;
  @HiveField(2)
  String? code;
  @HiveField(3)
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
