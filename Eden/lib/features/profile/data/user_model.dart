class UserModel {
  String id;
  String name;
  String bio;
  String profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
  });
}

UserModel currentUser = UserModel(
  id: 'fwj93jfwj',
  bio: 'Design Expert',
  name: 'Emmy Clark',
  profileImage:
      'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
);
