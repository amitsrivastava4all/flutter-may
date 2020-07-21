class Db {
  static List<String> getCourses() {
    List<String> courses = ["C", "C++", "Java", "JS", "DART"];
    return courses;
  }

  static Map<String, bool> getHobbies() {
    return {"reading": true, "travel": false, "sports": false};
  }

  static Map<String, int> getGender() {
    return {"male": 1, "female": 2};
  }
}
