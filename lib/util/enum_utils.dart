class EnumUtils {
  static T enumFromString<T>(List<T> values, String value) {
    final valueMap = {for (var v in values) v.toString().split('.').last: v};

    final result = valueMap[value];
    if (result == null) {
      throw ArgumentError('Valor desconhecido: $value');
    }
    return result;
  }
}