class FilterInfo {
  String name;
  String tag;

  FilterInfo({
    required this.name,
    required this.tag,
  });

  Map toJson() {
    Map map = {};
    map["name"] = name;
    map["tag"] = tag;
    return map;
  }
}
