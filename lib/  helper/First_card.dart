// Our movie model
class First_card {
  final String  poster, name;

  First_card({
    this.poster,
    this.name,
  });
}

// our demo data movie data
List<First_card> movies = [
  First_card(
    name: "Governance",
    poster: "assets/Images/governance.jpg",
  ),
  First_card(
    name: "Defence",
    poster: "assets/Images/def.jpg",
  ),
  First_card(
    name: "Male",
    poster: "assets/Images/mal.jpg",
  ),
  First_card(
    name: "Science",
    poster: "assets/Images/sci.jpg",
  ),
  First_card(
    name: "Female",
    poster: "assets/Images/female.jpg",
  ),
  First_card(
    name: "Sports",
    poster: "assets/Images/sports.jpg",
  ),
  First_card(
    name: "Others",
    poster: "assets/Images/otherimg.jpg",
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";