# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  User.create(name: 'josia')
  Categorie.create(name: 'Tv', priority: 1)
  Categorie.create(name: 'Radio', priority: 2)
  Categorie.create(name: 'Car', priority: 3)
  Categorie.create(name: 'Train', priority: 4)
  Article.create(title: 'Lorenzo',
    text: "Lorenzo Fernando Lamas, dit Lorenzo Lamas, est un acteur et réalisateur américain né le
    20 janvier 1958 à Santa Monica. Il est le fils de Fernando Lamas et Arlene Dahl, une actrice américano-norvégienne.
    Lorenzo Fernando Lamas, dit Lorenzo Lamas, est un acteur et réalisateur américain né le
    20 janvier 1958 à Santa Monica.",
    authorid: 1, image_file_name: 'abstract.jpg', image_content_type: 'image/jpeg', image_file_size: 74304)
  Relation.create(article_id: 1, category_id: 1)
  Article.create(title: 'Madagascar',
    text: "Madagascar est une île immense et un pays situé au large de la côte sud-est de l'Afrique.
    Il abrite des milliers d'espèces animales endémiques comme les lémuriens, ainsi que des forêts tropicales.
    Madagascar est une île immense et un pays situé au large de la côte sud-est de l'Afrique.",
    authorid: 1, image_file_name: 'jpeg-ou-png.jpg', image_content_type: 'image/jpeg', image_file_size: 68734)
  Relation.create(article_id: 2, category_id: 2)
  Article.create(title: 'Nosy be',
    text: "Nosy Be est une île au large de la côte nord-ouest de Madagascar. Au sud-est, les forêts de la réserve
     de Lokobé abritent des caméléons, des geckos et des grenouilles.
     Hell-Ville, la capitale.Nosy Be est une île au large de la côte nord-ouest de Madagascar.",
    authorid: 1, image_file_name: 'red.jpg', image_content_type: 'image/jpeg', image_file_size: 37487)
  Relation.create(article_id: 3, category_id: 3)
  Article.create(title: 'Toliara',
    text: "Étendue au bord du canal de Mozambique et à proximité du tropique du Capricorne, Toliara, appelée
Tuléar en français, est la plus grande ville du Sud de Madagascar. C'est le chef-lieu de la région Atsimo-Andrefana
après avoir été celui de la province de Toliara. ",
    authorid: 1, image_file_name: 'unnamed.jpg', image_content_type: 'image/jpeg', image_file_size: 38814)
  Relation.create(article_id: 4, category_id: 4)
