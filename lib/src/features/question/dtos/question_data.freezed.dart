// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionData {
  int get position => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  Question get question => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionDataCopyWith<QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionDataCopyWith<$Res> {
  factory $QuestionDataCopyWith(
          QuestionData value, $Res Function(QuestionData) then) =
      _$QuestionDataCopyWithImpl<$Res, QuestionData>;
  @useResult
  $Res call({int position, int length, Question question});
}

/// @nodoc
class _$QuestionDataCopyWithImpl<$Res, $Val extends QuestionData>
    implements $QuestionDataCopyWith<$Res> {
  _$QuestionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? length = null,
    Object? question = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionDataCopyWith<$Res>
    implements $QuestionDataCopyWith<$Res> {
  factory _$$_QuestionDataCopyWith(
          _$_QuestionData value, $Res Function(_$_QuestionData) then) =
      __$$_QuestionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, int length, Question question});
}

/// @nodoc
class __$$_QuestionDataCopyWithImpl<$Res>
    extends _$QuestionDataCopyWithImpl<$Res, _$_QuestionData>
    implements _$$_QuestionDataCopyWith<$Res> {
  __$$_QuestionDataCopyWithImpl(
      _$_QuestionData _value, $Res Function(_$_QuestionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? length = null,
    Object? question = null,
  }) {
    return _then(_$_QuestionData(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }
}

/// @nodoc

class _$_QuestionData implements _QuestionData {
  const _$_QuestionData(
      {required this.position, required this.length, required this.question});

  @override
  final int position;
  @override
  final int length;
  @override
  final Question question;

  @override
  String toString() {
    return 'QuestionData(position: $position, length: $length, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionData &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, length, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      __$$_QuestionDataCopyWithImpl<_$_QuestionData>(this, _$identity);
}

abstract class _QuestionData implements QuestionData {
  const factory _QuestionData(
      {required final int position,
      required final int length,
      required final Question question}) = _$_QuestionData;

  @override
  int get position;
  @override
  int get length;
  @override
  Question get question;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionDataCopyWith<_$_QuestionData> get copyWith =>
      throw _privateConstructorUsedError;
}
