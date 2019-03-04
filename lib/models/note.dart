class Note {

  int _id;
  String _name, _note, _created_at, _updated_at;

  Note(this._name, this._note, this._created_at, this._updated_at);
  Note.withID(this._id, this._name, this._note, this._created_at, this._updated_at);

  int get id => _id;
  set id(int id) => _id = id;

  String get name => _name;
  set name(String name) => _name = name;

  String get note => _note;
  set note(String note) => _note = note;

  String get created_at => _created_at;

  String get updated_at => _updated_at;
  set updated_at(String updated_at) => _updated_at = updated_at;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null)
      map['id'] = _id;

    map['name'] = _name;
    map['note'] = _note;
    map['created_at'] = _created_at;
    map['updated_at'] = _updated_at;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._note = map['note'];
    this._created_at = map['created_at'];
    this._updated_at = map['updated_at'];
  }

}
