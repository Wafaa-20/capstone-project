// core/extension/mapper.dart
extension ListMapper<T> on List<dynamic> {
  List<M> mapToModels<M>(M Function(Map<String, dynamic> json) fromJson) {
    return map<M>((e) => fromJson(e as Map<String, dynamic>)).toList();
  }
}