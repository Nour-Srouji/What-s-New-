abstract class UploadImageEntity{
  final String imageUrl;
  UploadImageEntity(this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UploadImageEntity &&
              runtimeType == other.runtimeType &&
              imageUrl == other.imageUrl;

  @override
  int get hashCode => imageUrl.hashCode;

  @override
  String toString() {
    return 'UploadImageEntity{imageUrl: $imageUrl}';
  }
}