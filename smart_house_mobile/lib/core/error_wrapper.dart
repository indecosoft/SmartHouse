import 'dart:io';

import 'package:Homey/core/business_exception.dart';
import 'package:Homey/core/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Future<T> errorWrapper<T>(ValueGetter<Future<T>> callable,
    {final BusinessException? Function(Object)? mapper}) async {
  try {
    return await callable.call();
  } catch (ex) {
    if (ex is BusinessException) {
      rethrow;
    }
    throw mapper?.call(ex) ?? defaultExceptionMapper(ex);
  }
}

Future<T> apiWrapper<T, R>({
  required final ValueGetter<Future<Response>> callable,
  required final T Function(R data) responseMapper,
  final BusinessException? Function(Object)? exceptionMapper,
  final String? tag,
}) async {
  final Stopwatch? stopwatch = kReleaseMode ? null : (Stopwatch()..start());

  try {
    final response = await callable.call();
    stopwatch?.stop();
    logger.i(
      '${tag ?? 'ApiWrapper'}: callable ${response.realUri.path} executed in ${stopwatch?.elapsed}',
    );

    final data = response.data;

    if (null is T) {
      if (data == null) {
        return null as T;
      }
    }

    if (data == null) {
      throw NoDataException();
    }

    stopwatch
      ?..reset()
      ..start();
    final mappedResponse = responseMapper.call(data as R);
    stopwatch?.stop();

    logger.i(
      '${tag ?? 'ApiWrapper'}: mapping for ${response.realUri.path} done in ${stopwatch?.elapsed}',
    );

    return mappedResponse;
  } catch (ex) {
    if (ex is BusinessException) {
      rethrow;
    }
    throw exceptionMapper?.call(ex) ?? defaultExceptionMapper(ex);
  }
}

BusinessException defaultExceptionMapper(final Object ex) {
  if (ex is BusinessException) {
    return ex;
  }
  if (ex is TypeError) {
    return ParseException(cause: ex);
  }

  if (ex is DioException) {
    if (ex.error is SocketException) {
      return InternetConnectionException(cause: ex.error);
    }
    final code = ex.response?.statusCode;
    if (code != null) {
      if (code >= 500 && code < 600) {
        return InternalServerException(statusCode: code, cause: ex.error);
      }
      if (code >= 400 && code < 500) {
        switch (code) {
          case 401:
            return AuthorizationException(cause: ex.error);
          case 404:
            return ApiNotFoundException(cause: ex.error);
          default:
            return ClientRequestException(statusCode: code, cause: ex.error);
        }
      }
    }
  }

  return UnknownException(cause: ex);
}
