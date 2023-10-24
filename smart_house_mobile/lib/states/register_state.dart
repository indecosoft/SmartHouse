// import 'package:Homey/core/resource.dart';
// import 'package:Homey/core/helpers/web_requests_helpers/web_requests_helpers.dart';
// import 'package:Homey/models/register_model.dart';
// import 'package:rxdart/rxdart.dart';

// class RegisterState {
//   // streams
//   final BehaviorSubject<bool> _isPasswordHidden =
//       BehaviorSubject<bool>.seeded(true);
//   final BehaviorSubject<bool> _isPasswordVerificationHidden =
//       BehaviorSubject<bool>.seeded(true);
//   final BehaviorSubject<bool> _autoValidate =
//       BehaviorSubject<bool>.seeded(false);
//   final BehaviorSubject<bool> _termsAndConditions =
//       BehaviorSubject<bool>.seeded(false);

//   // streams getters
//   Stream<bool> get passwordToggleStream$ => _isPasswordHidden.stream;

//   Stream<bool> get passwordVerificationToggleStream$ =>
//       _isPasswordVerificationHidden.stream;

//   Stream<bool> get autoValidateStream$ => _autoValidate.stream;

//   Stream<bool> get termsAndConditionsStream$ => _termsAndConditions.stream;

//   // streams value getters
//   bool get isPasswordHidden => _isPasswordHidden.value;

//   bool get isPasswordVerificationHidden => _isPasswordVerificationHidden.value;

//   bool get autoValidate => _autoValidate.value;

//   bool get termsAndConditions => _termsAndConditions.value;

//   // setters
//   set autoValidate(bool state) {
//     _autoValidate.value = state;
//   }

//   set isPasswordHidden(bool state) {
//     _isPasswordHidden.value = state;
//   }

//   set isPasswordVerificationHidden(bool state) {
//     _isPasswordVerificationHidden.value = state;
//   }

//   set termsAndConditions(bool state) {
//     _termsAndConditions.value = state;
//   }

//   // methods
//   void togglePassword() {
//     _isPasswordHidden.value = !_isPasswordHidden.value;
//   }

//   void togglePasswordVerification() {
//     _isPasswordVerificationHidden.value = !_isPasswordVerificationHidden.value;
//   }

//   Future<void> register({required RegisterModel model}) async {
//     model.onResult('Loading...', ApiState.loading);
//     await WebRequestsHelpers.post(route: '/api/register', body: model.toMap())
//         .then((dynamic response) async {
//       final dynamic data = response.json();
//       if (data['success'] != null) {
//         model.onResult(data, ApiState.successful);
//       } else {
//         model.onResult(data['error'].toString(), ApiState.error);
//       }
//     }, onError: (e) {
//       model.onResult(e.toString(), ApiState.error);
//     });
//   }

//   void dispose() {
//     _isPasswordHidden.close();
//     _termsAndConditions.close();
//     _isPasswordVerificationHidden.close();
//     _autoValidate.close();
//   }
// }
