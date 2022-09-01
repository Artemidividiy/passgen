import 'dart:convert';

class Password {
  int alphabets_count;
  int digits_count;
  int length;
  String password;
  int seed;
  int special_characters_count;
  Password({
    required this.alphabets_count,
    required this.digits_count,
    required this.length,
    required this.password,
    required this.seed,
    required this.special_characters_count,
  });

  Password copyWith({
    int? alphabets_count,
    int? digits_count,
    int? length,
    String? password,
    int? seed,
    int? special_characters_count,
  }) {
    return Password(
      alphabets_count: alphabets_count ?? this.alphabets_count,
      digits_count: digits_count ?? this.digits_count,
      length: length ?? this.length,
      password: password ?? this.password,
      seed: seed ?? this.seed,
      special_characters_count:
          special_characters_count ?? this.special_characters_count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'alphabets_count': alphabets_count,
      'digits_count': digits_count,
      'length': length,
      'password': password,
      'seed': seed,
      'special_characters_count': special_characters_count,
    };
  }

  factory Password.fromMap(Map<String, dynamic> map) {
    return Password(
      alphabets_count: map['alphabets_count']?.toInt() ?? 0,
      digits_count: map['digits_count']?.toInt() ?? 0,
      length: map['length']?.toInt() ?? 0,
      password: map['password'] ?? '',
      seed: map['seed']?.toInt() ?? 0,
      special_characters_count: map['special_characters_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Password.fromJson(String source) =>
      Password.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Password(alphabets_count: $alphabets_count, digits_count: $digits_count, length: $length, password: $password, seed: $seed, special_characters_count: $special_characters_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Password &&
        other.alphabets_count == alphabets_count &&
        other.digits_count == digits_count &&
        other.length == length &&
        other.password == password &&
        other.seed == seed &&
        other.special_characters_count == special_characters_count;
  }

  @override
  int get hashCode {
    return alphabets_count.hashCode ^
        digits_count.hashCode ^
        length.hashCode ^
        password.hashCode ^
        seed.hashCode ^
        special_characters_count.hashCode;
  }
}
