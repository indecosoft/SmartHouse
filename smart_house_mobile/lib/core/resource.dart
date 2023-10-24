import 'package:Homey/core/business_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
class Resource<T> with _$Resource {
  factory Resource.initial() = ResourceInitial;
  factory Resource.loading() = ResourceLoading;
  factory Resource.success({required T data}) = ResourceSuccess;
  factory Resource.error({required BusinessException error}) = ResourceError;
}

enum ApiState { initial, successful, error, loading }

typedef OnResult = void Function(dynamic, ApiState);
