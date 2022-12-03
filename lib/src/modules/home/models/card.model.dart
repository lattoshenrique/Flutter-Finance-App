class CardViewModel {
  bool? isPositive;
  double? diff;
  double? percentage;

  CardViewModel({this.isPositive, this.diff, this.percentage});

  CardViewModel.fromJson(Map<String, dynamic> json) {
    isPositive = json['is_positive'];
    diff = json['diff'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_positive'] = isPositive;
    data['diff'] = diff;
    data['percentage'] = percentage;
    return data;
  }
}
