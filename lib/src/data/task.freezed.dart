// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String? get id => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  bool get isCompleted =>
      throw _privateConstructorUsedError; // required DateTime createAt,
// required DateTime updateAt,
// required DateTime deadline,
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({String? id, String? body, bool isCompleted, String category});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? isCompleted = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? body, bool isCompleted, String category});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? isCompleted = null,
    Object? category = null,
  }) {
    return _then(_$_Task(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {this.id,
      required this.body,
      required this.isCompleted,
      required this.category});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String? id;
  @override
  final String? body;
  @override
  final bool isCompleted;
// required DateTime createAt,
// required DateTime updateAt,
// required DateTime deadline,
  @override
  final String category;

  @override
  String toString() {
    return 'Task(id: $id, body: $body, isCompleted: $isCompleted, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, body, isCompleted, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {final String? id,
      required final String? body,
      required final bool isCompleted,
      required final String category}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String? get id;
  @override
  String? get body;
  @override
  bool get isCompleted;
  @override // required DateTime createAt,
// required DateTime updateAt,
// required DateTime deadline,
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskList {
  List<Task> get tasks => throw _privateConstructorUsedError;
  FilterType get filterType => throw _privateConstructorUsedError;
  List<Task> get allTasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListCopyWith<TaskList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListCopyWith<$Res> {
  factory $TaskListCopyWith(TaskList value, $Res Function(TaskList) then) =
      _$TaskListCopyWithImpl<$Res, TaskList>;
  @useResult
  $Res call({List<Task> tasks, FilterType filterType, List<Task> allTasks});
}

/// @nodoc
class _$TaskListCopyWithImpl<$Res, $Val extends TaskList>
    implements $TaskListCopyWith<$Res> {
  _$TaskListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? filterType = null,
    Object? allTasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as FilterType,
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskListCopyWith<$Res> implements $TaskListCopyWith<$Res> {
  factory _$$_TaskListCopyWith(
          _$_TaskList value, $Res Function(_$_TaskList) then) =
      __$$_TaskListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks, FilterType filterType, List<Task> allTasks});
}

/// @nodoc
class __$$_TaskListCopyWithImpl<$Res>
    extends _$TaskListCopyWithImpl<$Res, _$_TaskList>
    implements _$$_TaskListCopyWith<$Res> {
  __$$_TaskListCopyWithImpl(
      _$_TaskList _value, $Res Function(_$_TaskList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? filterType = null,
    Object? allTasks = null,
  }) {
    return _then(_$_TaskList(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as FilterType,
      allTasks: null == allTasks
          ? _value._allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_TaskList implements _TaskList {
  const _$_TaskList(
      {final List<Task> tasks = const [],
      this.filterType = FilterType.active,
      final List<Task> allTasks = const []})
      : _tasks = tasks,
        _allTasks = allTasks;

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final FilterType filterType;
  final List<Task> _allTasks;
  @override
  @JsonKey()
  List<Task> get allTasks {
    if (_allTasks is EqualUnmodifiableListView) return _allTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTasks);
  }

  @override
  String toString() {
    return 'TaskList(tasks: $tasks, filterType: $filterType, allTasks: $allTasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskList &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            const DeepCollectionEquality().equals(other._allTasks, _allTasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      filterType,
      const DeepCollectionEquality().hash(_allTasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskListCopyWith<_$_TaskList> get copyWith =>
      __$$_TaskListCopyWithImpl<_$_TaskList>(this, _$identity);
}

abstract class _TaskList implements TaskList {
  const factory _TaskList(
      {final List<Task> tasks,
      final FilterType filterType,
      final List<Task> allTasks}) = _$_TaskList;

  @override
  List<Task> get tasks;
  @override
  FilterType get filterType;
  @override
  List<Task> get allTasks;
  @override
  @JsonKey(ignore: true)
  _$$_TaskListCopyWith<_$_TaskList> get copyWith =>
      throw _privateConstructorUsedError;
}
