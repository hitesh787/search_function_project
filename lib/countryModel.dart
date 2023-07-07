
class CountryModel {
  CountryModel({
      String? name, 
      String? code, 
      String? emoji, 
      String? unicode, 
      String? image,}){
    _name = name;
    _code = code;
    _emoji = emoji;
    _unicode = unicode;
    _image = image;
}

  CountryModel.fromJson(dynamic json) {
    _name = json['name'];
    _code = json['code'];
    _emoji = json['emoji'];
    _unicode = json['unicode'];
    _image = json['image'];
  }
  String? _name;
  String? _code;
  String? _emoji;
  String? _unicode;
  String? _image;
CountryModel copyWith({  String? name,
  String? code,
  String? emoji,
  String? unicode,
  String? image,
}) => CountryModel(  name: name ?? _name,
  code: code ?? _code,
  emoji: emoji ?? _emoji,
  unicode: unicode ?? _unicode,
  image: image ?? _image,
);
  String? get name => _name;
  String? get code => _code;
  String? get emoji => _emoji;
  String? get unicode => _unicode;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['code'] = _code;
    map['emoji'] = _emoji;
    map['unicode'] = _unicode;
    map['image'] = _image;
    return map;
  }

}