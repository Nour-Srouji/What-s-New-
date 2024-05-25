class JobParams {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String expirationDate;

  JobParams(
      {
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.expirationDate,
      required this.title});

  Map<String, dynamic> toJson() {
    return {
      "image_url": imageUrl,
      "date": date,
      "title": title,
      "description": description,
      "expiration_date": expirationDate,
    };
  }

  @override
  String toString() {
    return 'JobParams{title: $title, description: $description, imageUrl: $imageUrl, date: $date, expirationDate: $expirationDate}';
  }
}
