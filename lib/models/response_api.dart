import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? refresh;
  String? access;
  ResponseApi({
    this.refresh,
    this.access,
  });

  factory ResponseApi.fromJson(json) => ResponseApi(
        refresh: json["refresh"],
        access: json["access"],
      );

   toJson() => {
        "message": refresh,
        "access": access,
      };
}
