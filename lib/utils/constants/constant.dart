class Constant {
  static const kB = 1024;
  static const mB = 1024 * kB;

  static const logSize = 5 * Constant.mB;

  static const second = 1000;
  static const minute = 60 * second;
  static const hour = 60 * minute;
  static const oneDayInMilSeconds = 24 * 60 * 60 * 1000;

  static const mailTo = 'mailto:';
  static const int maxImagesAttachment = 20;
  static const int intMax = -1 >>> 1;
  static const imageMaxSize = 1200.0;
  static const registerDownloadPortName = 'downloader_send_port';

  static const fireStoreFolders = ['apartment_banner', 'home_banner'];

  static const forceUpdate = 1;
  static const recommendUpdate = 2;

  static const bundleId = 'com.vinhomes.resident';
  static const iOSAppLink = 'https://apps.apple.com/us/app/myvinhomes/id6450522818';
  static const androidAppLink = 'https://play.google.com/store/apps/details?id=$bundleId';

  static const limitTimeShowPopupDefault = 24 * 60 * 60 * 1000;

  static const bannerRatio = 654.0 / 180.0;
  static const thumbnailRatio = 834.0 / 492.0;
}

class Fonts {
  static final familyInterBold = 'InterBold';
  static final familyInterSemiBold = 'InterSemiBold';
  static final familyInterRegular = 'InterRegular';
}

class DateTimeFormat {
  static const gmt = "yyyy-MM-dd'T'HH:mm:ss.SSS";
  static const ddMMyyyy = 'dd.MM.yyyy';
  static const HHmmddMMyyyy = 'HH:mm - dd.MM.yyyy';
  static const ddMMyyyyHHmmDot = 'dd.MM.yyyy HH:mm';
  static const HHmmddMMyyyyDot = 'HH:mm • dd.MM.yyyy';
  static const HHmmddMMyyyySlash = 'HH:mm - dd/MM/yyyy';
  static const ddMMyyyyMinus = 'dd-MM-yyyy';
  static const ddMMyyyySlash = 'dd/MM/yyyy';
  static const ddMMyyyyHHmm = 'dd/MM/yyyy - HH:mm';
  static const ddMMyyyHHmmSlash = 'dd/MM/yyyy HH:mm';
  static const ddMMyyyHHmmssSlash = 'dd/MM/yyyy HH:mm:ss';
  static const yyyyMMddHHmmMinus = 'yyyy-MM-dd HH:mm';
  static const yyyyMMddMinus = 'yyyy-MM-dd';
  static const HHmm = 'HH:mm';
  static const MMyyyy = 'MM/yyyy';
  static const HHmmss = 'HH:mm:ss';
  static const EEEEddMMyyyy = 'EEEE, dd.MM.yyyy';
  static const MMYYYY = 'MMMM, yyyy';
  static const HHmm12Time = 'h:mm a';
  static const HHmmSpaceddMMyyyy = 'HH:mm dd/MM/yyyy';
  static const ddMMMMyyyy = 'dd MMMM, yyyy';
  static const ddMM = 'dd.MM';
}

enum ErrorCode {
  eNetwork,
  eNotExistsAccount,
  eLoginFailed,
  eErrorUsernameOrPass,
  eNeedChangePass,
  eNeedUpdateApp;

  static ErrorCode? fromCode(int? code) {
    return switch (code) {
      networkError => eNetwork,
      notExistsAccount => eNotExistsAccount,
      loginFailed => eLoginFailed,
      errorUsernameOrPass => eNeedChangePass,
      needChangePass => eNeedChangePass,
      needUpdateApp => eNeedUpdateApp,
      _ => null,
    };
  }

  static const networkError = 1020;
  static const cannotConnectToServer = 1021;
  static const notExistsAccount = 404;
  static const loginFailed = 1023;
  static const passwordIncorrect = 906;
  static const sessionExpired = 921;
  static const loginOnOtherDevice = 1319;
  static const errorUsernameOrPass = 4010004;
  static const needChangePass = 4030010;
  static const needUpdateApp = 88888;
}

class Regex {
  static const min8Character = r'.{8,}';
  static const atLeast1NormalChar = r'(?=.*?[a-z])';
  static const atLeast1Number = r'.*[0-9].*';
  static const atLeast1Uppercase = r'(?=.*[A-Z])';
  static const atLeast1SpecialChar = r'[!@#\$&*%?]';
  static const noSpace = r'^(?!.*\s)';
  static const correctPhoneNumber = r'(0\d{9}|09\d{8})';
  static const correctEmail = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
  static const licensePlates = r'^[a-zA-Z0-9-.]{1,20}$';
}

class ArgumentKey {
  static const transactionId = 'transactionId';
  static const referenceId = 'referenceId';
  static const orderId = 'orderId';
  static const listData = 'listData';
  static const hasFilter = 'hasFilter';
  static const startDate = 'startDate';
  static const endDate = 'endDate';
  static const listStatus = 'listStatus';
  static const listUtility = 'listUtility';
  static const phoneNumber = 'phoneNumber';
  static const otp = 'otp';
  static const apartmentId = 'apartmentId';
  static const duedate = 'duedate';
  static const listService = 'listService';
  static const serviceItemType = 'serviceItemType';
  static const requestType = 'requestType';
  static const guestData = 'guestData';
  static const isServerData = 'isServerData';
  static const areaName = 'areaName';
  static const apartmentCode = 'apartmentCode';
  static const id = 'id';
  static const typeDetail = 'typeDetail';
  static const bulletin = 'bulletin';
  static const comeFrom = 'comeFrom';
  static const showToast = 'showToast';
  static const route = 'route';
  static const time = 'time';
  static const checkExpired = 'prefNewsPopupId';
  static const navEnableLeadingIfNeed = 'navEnableLeadingIfNeed';
  static const eventSubType = 'eventSubType';
  static const constructionType = 'constructionType';
  static const object = 'object';
  static const vincomStore = 'vincomStore';
  static const vincomStatus = 'vincomStatus';
  static const vincomVoucher = 'vincomVoucher';
  static const menuAppCode = 'menuAppCode';
  static const message = 'message';
  static const key = 'key';
  static const value = 'value';
  static const number = 'number';
  static const imgs = 'imgs';
  static const index = 'index';
  static const title = 'title';
  static const vinclubPoint = 'vinclubPoint';
  static const eventName = 'eventName';
  static const type = 'type';
  static const vinCode = 'vinCode';
  static const data1 = 'data1';
  static const data2 = 'data2';
}

enum EventSubType { PAYMENT_UTILITY, PAYMENT_BILL, NEWS_EXTERNAL }

class NotificationTypeKey {
  static const ALL = 'ALL';
  static const SERVICE = 'SERVICE';
  static const PAYMENT = 'PAYMENT';
  static const NEWS = 'NEWS';
  static const MAINTENANCE = 'MAINTENANCE';
  static const PUBLIC = 'PUBLIC';
  static const LIFE = 'LIFE';
  static const REPAIR = 'REPAIR';
  static const VIOLATION = 'VIOLATION';
  static const WARNING = 'WARNING';
  static const MINIAPP = 'MINIAPP';
  static const EVENT = 'EVENT';
  static const VINACCOUNT = 'VINACCOUNT';
  static const VOUCHER_BULLETIN = 'VOUCHER_BULLETIN';
}

class TextLength {
  static const CCCD = 12;
  static const name = 120;
  static const phone = 10;
  static const textBox = 255;
  static const reason = 500;
  static const licensePlates = 20;
  static const brandVehicle = 25;
  static const typeOfShippingStuff = 50;
  static const quantity = 7;
  static const note = 50;
  static const email = 200;
}

class HiveBox {
  static const newsPopup = "news_popup";
  static const featureUsage = "feature_usage";
  static const existNewsPopupBox = "exist_news_popup_box";
}

class DefinedHiveDB {
  static const newsPopupTypeId = 10;
}

class AnalyticEventName {
  static const otp_request = 'otp_request';
  static const otp_success = 'otp_success';
  static const department_list_request = 'department_list_request';
  static const department_list_fail = 'department_list_fail';
  static const department_list_empty = 'department_list_empty';
  static const department_list_sync_request = 'department_list_sync_request';
  static const department_list_sync_fail = 'department_list_sync_fail';
  static const department_detail = 'department_detail';
}

class CaptchaAction {
  static const unknown = 'unknown';
  static const bookingUtility = 'booking_utility';
  static const extraBooking = 'extra_booking';
  static const oautLogin = 'oaut_login';
  static const validatePassword = 'validate_password';
  static const sendOtp = 'send_otp';
}

class VinClubUrl {
  static const register = 'https://vinclub.vn/download';
  static const viewBenefitDetails = 'https://vinclub.vn';
}
