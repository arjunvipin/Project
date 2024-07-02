import 'package:json_annotation/json_annotation.dart';

part 'phishOrnotresult.g.dart';

@JsonSerializable()
class LetterParseModelGet {
  @JsonKey(name: 'output')
  List<String>? output; // Change output type to List<String>

  LetterParseModelGet({this.output});
  LetterParseModelGet.create({required this.output});

  factory LetterParseModelGet.fromJson(Map<String, dynamic> json) {
    // Convert the output string to a list if it's not null
    var outputList = (json['output'] as String?)?.split(',') ?? [];

    return LetterParseModelGet(
      output: outputList,
    );
  }

  Map<String, dynamic> toJson() {
    // Convert the output list to a comma-separated string
    var outputString = output?.join(',') ?? '';
    return {'output': outputString};
  }
}
