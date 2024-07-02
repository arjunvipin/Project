import 'package:json_annotation/json_annotation.dart';

part 'urldetails.g.dart';

@JsonSerializable()
class Urldetails {
  @JsonKey(name: 'tableout')
  List<dynamic>? tableout;

  Urldetails({this.tableout});
  Urldetails.create({required this.tableout});

  factory Urldetails.fromJson(Map<String, dynamic> json) => Urldetails(
        tableout: json['tableout'] as List<dynamic>?,
      );


  Map<String, dynamic> toJson() {
    var tableoutput = tableout?.join(',') ?? '';
    return {'tableout': tableoutput};
  }
}
