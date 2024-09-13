/// Back-end's end-points stored in this enum
enum EndPointEnums {
  userLogin('/users/login'),
  userSignUp('/users/register'),
  refreshToken('/users/refreshToken'),
  setLanguage('/user/language'),
  friendsData('/friends/data'),
  friendRequestSend('/friends/sendRequest'),
  friendRequestAccept('/friends/accept'),
  friendRequestReject('/friends/reject'),
  searchFriend('/search/');

  final String value;

  const EndPointEnums(this.value);
}
