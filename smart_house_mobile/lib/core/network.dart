import 'package:Homey/app_data_manager.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network.g.dart';

const String _baseUrl = 'http://10.3.141.159:8000';
// const String _baseUrl = 'http://10.20.20.10:8000';

@riverpod
Dio dio(DioRef ref) => Dio(BaseOptions(baseUrl: _baseUrl))
  ..interceptors.addAll([
    InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options
        ..headers.addAll({
          'authorization':
              'Bearer ${ref.watch(sharedPreferencesProvider).get('token')}',
        }));
    })
  ]);
