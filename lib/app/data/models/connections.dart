class Connections {
  String? groupAffiliation;
  String? relatives;

  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["group-affiliation"],
        relatives: json["relatives"],
      );

  Map<String, dynamic> toJson() => {
        "group-affiliation": groupAffiliation,
        "relatives": relatives,
      };
}
