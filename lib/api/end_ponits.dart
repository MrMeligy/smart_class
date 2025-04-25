class EndPoint {
  static String baseUrl =
      "http://journijotsv2.runasp.net/api/"; //http://10.0.2.2:5206/api/ // http://journijotsv1.runasp.net/api/
  static String logIn = "Account/Login";
  static String register = "Account/Register";
  static String uploadProfilePic = "Account/UploadProfilePicture";
  static String addInterests = "Account/AddIntersts";
  static String addPost = "Post/PostJot";
  static String getPostsEndPoint({String? lastPostDate}) {
    if (lastPostDate != null) {
      return "Post/GetPosts?pageSize=30&lastPostDate=$lastPostDate";
    }
    return "Post/GetPosts?pageSize=30";
  }

  static String getProfileEndPoint({required String id}) {
    return "User/GetUserProfile?userId=$id";
  }

  static String toggleLike = "Post/ToggleLike?postId=";
  static String postComment = "Post/Comment?postId=";
  static String getComment = "Post/GetPostComments?postId=";
  static String postFollow({required String userId}) {
    return "User/Follow?followedId=$userId";
  }

  static String getCityActivities(
      {required String city, required String pageNum}) {
    return "Places/GetActivitiesByCity?city=$city&pageNumber=$pageNum&pageSize=10";
  }

  static String getCityRestaurants(
      {required String city, required String pageNum}) {
    return "Places/GetRestaurantsByCity?city=$city&pageNumber=$pageNum&pageSize=10";
  }

  static String getCityHotels({required String city, required String pageNum}) {
    return "Places/GetHotelsByCity?city=$city&pageNumber=$pageNum&pageSize=10";
  }

  static String search({required String text, String? city}) {
    if (city != null) {
      return "User/searchByCity?name=$text&city=$city";
    }
    return "User/search?name=$text";
  }
}

class ApiKey {
  static String status = "status";
  static String message = "message";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String tokenId =
      "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier";
  static String id = "userId";
  static String user = "user";
  static String userName = "userName";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String profilePicture = "profilePicture";
  static String intersts = "intersts";
  static String follow = "follow";
  static String followed = "followed";
  static String posts = "posts";
  static String content = "content";
  static String date = "date";
  static String likes = "likes";
  static String comments = "comments";
}
