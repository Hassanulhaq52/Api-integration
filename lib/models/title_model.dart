class TitleModel {
  String? type;
  AwardsSummary? awardsSummary;
  HighlightedRanking? highlightedRanking;
  String? id;
  String? title;
  String? titleType;
  int? year;

  TitleModel(
      {this.type,
      this.awardsSummary,
      this.highlightedRanking,
      this.id,
      this.title,
      this.titleType,
      this.year});

  TitleModel.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    awardsSummary = json['awardsSummary'] != null
        ? new AwardsSummary.fromJson(json['awardsSummary'])
        : null;
    highlightedRanking = json['highlightedRanking'] != null
        ? new HighlightedRanking.fromJson(json['highlightedRanking'])
        : null;
    id = json['id'];
    title = json['title'];
    titleType = json['titleType'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    if (this.awardsSummary != null) {
      data['awardsSummary'] = this.awardsSummary!.toJson();
    }
    if (this.highlightedRanking != null) {
      data['highlightedRanking'] = this.highlightedRanking!.toJson();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['titleType'] = this.titleType;
    data['year'] = this.year;
    return data;
  }
}

class AwardsSummary {
  Highlighted? highlighted;
  int? otherNominationsCount;
  int? otherWinsCount;

  AwardsSummary(
      {this.highlighted, this.otherNominationsCount, this.otherWinsCount});

  AwardsSummary.fromJson(Map<String, dynamic> json) {
    highlighted = json['highlighted'] != null
        ? new Highlighted.fromJson(json['highlighted'])
        : null;
    otherNominationsCount = json['otherNominationsCount'];
    otherWinsCount = json['otherWinsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.highlighted != null) {
      data['highlighted'] = this.highlighted!.toJson();
    }
    data['otherNominationsCount'] = this.otherNominationsCount;
    data['otherWinsCount'] = this.otherWinsCount;
    return data;
  }
}

class Highlighted {
  String? awardName;
  int? count;
  String? eventId;
  bool? isWinner;

  Highlighted({this.awardName, this.count, this.eventId, this.isWinner});

  Highlighted.fromJson(Map<String, dynamic> json) {
    awardName = json['awardName'];
    count = json['count'];
    eventId = json['eventId'];
    isWinner = json['isWinner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['awardName'] = this.awardName;
    data['count'] = this.count;
    data['eventId'] = this.eventId;
    data['isWinner'] = this.isWinner;
    return data;
  }
}

class HighlightedRanking {
  String? id;
  String? label;
  int? rank;
  String? rankType;

  HighlightedRanking({this.id, this.label, this.rank, this.rankType});

  HighlightedRanking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    rank = json['rank'];
    rankType = json['rankType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['rank'] = this.rank;
    data['rankType'] = this.rankType;
    return data;
  }
}
