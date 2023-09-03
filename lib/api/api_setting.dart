class ApiSettings {
  static const _baseUrl = 'http://192.168.1.105:4040/api/v1/';
  static const logIn = '${_baseUrl}users/login';
  static const register = '${_baseUrl}users/register';
  static const articles = '${_baseUrl}articles';
  static const videos = '${_baseUrl}videos?page=-1';
  static const settings = '${_baseUrl}settings/';
  static const forgotPassword = '${_baseUrl}users/forgotPassword';
  static const verifyCode = '${_baseUrl}users/verifyCode';
  static const resetPassword = '${_baseUrl}users/resetPassword';
  static const categories = '${_baseUrl}categories';
  static const recommendations = '${_baseUrl}recommendations/unpaid/';
  static const recommendationsPaid = '${_baseUrl}recommendations/paid/';


}