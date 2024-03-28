class NetworkErrorMessage {
  static const String connectionTimeout = "Quá thời gian kết nối";
  static const String sendUrlTimeout = "Gửi yêu cầu không thành công";
  static const String recevingTimeout = "Không nhận được phản hồi";
  static const String cancel = "Hủy yêu cầu";
  static const String connectionError = "Lỗi kết nối";
  static const String unknown = "Lỗi không rõ. Thử lại sau";
  static const String badResponse = "Thông tin đăng nhập không chính xác";
  static const String badCertificate = "Chứng chỉ không chính xác";
}

class HomeCardTitle {
  static const String imageUrl = "assets/images";
  static const String avatar = "$imageUrl/avatar.jpg";
  static const List<String> title = [
    "Điểm danh",
    "Lịch học",
    "Xin nghỉ học",
    "Tin nhắn",
    "Đánh giá",
    "Lời nhắc",
    "Ngoại khóa",
    "Sức khỏe",
    "Thực đơn",
    "Khảo sát",
    "Học phí",
  ];
  static const List<String> homeCardTitle = [
    "$imageUrl/check_in.jpg",
    "$imageUrl/calendar.jpg",
    "$imageUrl/absences.png",
    "$imageUrl/message.png",
    "$imageUrl/teacher_review.jpg",
    "$imageUrl/noti.jpg",
    "$imageUrl/play_time.jpg",
    "$imageUrl/hearth.jpg",
    "$imageUrl/lunch.jpg",
    "$imageUrl/review.jpg",
    "$imageUrl/fee.jpg",
  ];
}
