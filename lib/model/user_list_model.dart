
class UserListModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserModel>? userData;

  UserListModel(
      this.page, this.perPage, this.total, this.totalPages, this.userData);

  UserListModel.fromJson(dynamic json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPages = json["total_pages"];
    userData = json["data"];
  }
}

class UserModel {
   int? id;
   String? email;
   String? firstName;
   String? lastName;
   String? userImage;

  UserModel(this.id, this.email, this.firstName, this.lastName, this.userImage);

  UserModel.fromJson(dynamic json){
    id = json["id"];
    email = json["email"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    userImage = json["avatar"];
  }
}
