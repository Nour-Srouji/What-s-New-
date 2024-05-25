class Source {
  final String? id;
  final String? name;

  Source({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Source &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode;
  }
}
