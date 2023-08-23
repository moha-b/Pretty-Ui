enum Genres {
  Fiction,
  Novel,
  Poetry,
  Narrative,
  Historical_Fiction,
  Non_fiction,
  Mystery,
  Horror,
  Childrens_Literature,
  Thriller,
  Sci_Fi,
  Crime,
  Romantic,
  History,

  Biography,
  Personal_growth,
  Culture_and_Society,

  Mind_and_Philosophy,
  Health_and_Fitness,
  Biographies,
  Education,
  Future,
  Technology,
  Life_style,
  Autobiography,
  Cookbook,
  Fantasy,
  Adventure,
  Drama,
  Humor,
  Self_help,
  Business,
  Science,
}

String get(Genres genre) {
  return Genres.values
      .firstWhere((element) => element == genre)
      .name
      .replaceAll('_', ' ');
}
