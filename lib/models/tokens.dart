import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  String token;
  DateTime expires;
  Payload payload;

  Token({
    required this.token,
    required this.expires,
    required this.payload,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        expires: DateTime.parse(json["expires"]),
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires.toIso8601String(),
        "payload": payload.toJson(),
      };
}

class Payload {
  String sub;
  String type;

  Payload({
    required this.sub,
    required this.type,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        sub: json["sub"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "sub": sub,
        "type": type,
      };
}
