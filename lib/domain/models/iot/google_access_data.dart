// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GoogleAccessData {
  String url;

  GoogleAccessData({
    required this.url,
  });

  GoogleAccessData copyWith({
    String? url,
  }) {
    return GoogleAccessData(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory GoogleAccessData.fromMap(Map<String, dynamic> map) {
    return GoogleAccessData(
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoogleAccessData.fromJson(String source) =>
      GoogleAccessData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GoogleAccessData(url: $url)';

  @override
  bool operator ==(covariant GoogleAccessData other) {
    if (identical(this, other)) return true;

    return other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
