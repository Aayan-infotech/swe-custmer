class ApiEndpoints{
  //Auth
  static const login = "auth/login";
  static const sendEmail = "auth/send-email";
  static const verifyOtp = "auth/verify-otp";
  static const resetPassword = "auth/resetPassword";


  //Dash
  static const getUserProfile = "user";
  static const getHistory = "book/history";
  static const getLatestReservation = "reserve/latest";
  static const updateReservation = "reserve/reservation";
  //Damage
  static const createDamageReport = "customer-damages/create";
  //Contact-Us
  static const contactUs = "create/creeate";
  static const feedbackReq = "request/create";


  //PDF
  static const invoice = "http://44.196.192.232:5001/api/pay/invoice";
  static const agreement = "sign/get-pdf";

}