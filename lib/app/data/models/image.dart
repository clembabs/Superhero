class ImageResponse {
  String? url;
  ImageResponse({
    this.url,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        url: json['url'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
      };
}
