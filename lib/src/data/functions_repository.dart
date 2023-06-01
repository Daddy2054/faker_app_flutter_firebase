import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FunctionsRepository {
  FunctionsRepository(this._functions);
  final FirebaseFunctions _functions;

  Future<void> deleteAllUserJobs() async {
    try {
      final callable = _functions.httpsCallable('deleteAllUserJobs');
      final result = await callable();
      final data = Map<Object?, Object?>.from(result.data);
      debugPrint(data.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

final functionsRepositoryProvider = Provider<FunctionsRepository>((ref) {
  return FunctionsRepository(FirebaseFunctions.instance);
});
