class TeamItem {
  final int id;
  final String team;
  final String group;
  String flagImage;
  int voteCount;

  TeamItem({
    required this.id,
    required this.team,
    required this.group,
    required this.flagImage,
    required this.voteCount,
  });

  factory TeamItem.fromJson(Map<String, dynamic> json){
    return TeamItem(
        id: json['id'],
        team: json['team'],
        group: json['group'],
        flagImage: json['flagImage'],
        voteCount: json['voteCount'],
    );
  }
}

