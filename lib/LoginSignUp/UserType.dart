enum UserType { STUDENT, TEACHER}

class UserTypeHelper {
  static String getValue(UserType userType) {
    switch (userType) {
      case UserType.STUDENT:
        return "STUDENT";
      case UserType.TEACHER:
        return "TEACHER";
      default:
        return 'UNKNOWN';
    }
  }

  static UserType getEnum(String userType) {
    if (userType == getValue(UserType.STUDENT)) {
      return UserType.STUDENT;
    } else if (userType == getValue(UserType.TEACHER)) {
      return UserType.TEACHER;
    }
  }
}