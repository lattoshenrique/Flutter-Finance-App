class SearchModel {
  String? symbol;
  String? name;
  String? exch;
  String? type;
  String? exchDisp;
  String? typeDisp;

  SearchModel({this.symbol, this.name, this.exch, this.type, this.exchDisp, this.typeDisp});

  SearchModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    exch = json['exch'];
    type = json['type'];
    exchDisp = json['exchDisp'];
    typeDisp = json['typeDisp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['name'] = name;
    data['exch'] = exch;
    data['type'] = type;
    data['exchDisp'] = exchDisp;
    data['typeDisp'] = typeDisp;
    return data;
  }
}
