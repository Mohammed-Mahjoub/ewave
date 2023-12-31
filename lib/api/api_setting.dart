class ApiSettings {
  static const _baseUrl = 'http://ewaveonline.com:4040/api/v1/';
  static const logIn = '${_baseUrl}users/login';
  static const register = '${_baseUrl}users/register';
  static const delete = '${_baseUrl}users/';
  static const articles = '${_baseUrl}articles';
  static const videos = '${_baseUrl}videos/free';
  static const videosPay = '${_baseUrl}videos/paid';
  static const settings = '${_baseUrl}settings';
  static const forgotPassword = '${_baseUrl}users/forgotPassword';
  static const verifyCode = '${_baseUrl}users/verifyCode';
  static const resetPassword = '${_baseUrl}users/resetPassword';
  static const categories = '${_baseUrl}categories';
  static const recommendations = '${_baseUrl}recommendations/unpaid';
  static const recommendationsPaid = '${_baseUrl}recommendations/paid/';
  static const pay = '${_baseUrl}payments/pay';
  static const apple = '${_baseUrl}payments/apple';
}
