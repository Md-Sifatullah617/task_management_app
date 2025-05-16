/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'greeting.dart' as _i2;
import 'task.dart' as _i3;
import 'task_status.dart' as _i4;
import 'package:task_management_app_client/src/protocol/task.dart' as _i5;
export 'greeting.dart';
export 'task.dart';
export 'task_status.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Task) {
      return _i3.Task.fromJson(data) as T;
    }
    if (t == _i4.TaskStatus) {
      return _i4.TaskStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Task?>()) {
      return (data != null ? _i3.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.TaskStatus?>()) {
      return (data != null ? _i4.TaskStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i5.Task>) {
      return (data as List).map((e) => deserialize<_i5.Task>(e)).toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.Task) {
      return 'Task';
    }
    if (data is _i4.TaskStatus) {
      return 'TaskStatus';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i3.Task>(data['data']);
    }
    if (dataClassName == 'TaskStatus') {
      return deserialize<_i4.TaskStatus>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
