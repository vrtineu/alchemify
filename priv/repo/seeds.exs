# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Alchemify.Repo.insert!(%Alchemify.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Alchemify.Repo
alias Alchemify.Schemas.{Album, Artist, Category, Favorite, RecentlyPlayed, Song, User}

# ========================
# CATEGORIES
# ========================

rock = Repo.insert!(%Category{name: "Rock", image_url: "rock.png"})
blues = Repo.insert!(%Category{name: "Blues", image_url: "blues.png"})
country = Repo.insert!(%Category{name: "Country", image_url: "country.png"})
jazz = Repo.insert!(%Category{name: "Jazz", image_url: "jazz.png"})

# ========================
# ARTISTS, ALBUMS, SONGS
# ========================

# Andrew Hows

andrew_howes = Repo.insert!(%Artist{name: "Andrew Howes", photo_url: "andrew_howes.jpg"})

gubernator =
  Repo.insert!(%Album{
    title: "Gubernator",
    date: ~D[2016-01-01],
    cover_url: "gubernator.jpg",
    artist_id: andrew_howes.id,
    category_id: rock.id
  })

dumb_luck = Repo.insert!(%Song{title: "Dumb Luck", album_id: gubernator.id, album: gubernator})
helmsman = Repo.insert!(%Song{title: "Helmsman", album_id: gubernator.id, album: gubernator})
crimea = Repo.insert!(%Song{title: "Crimea", album_id: gubernator.id, album: gubernator})

traitors_gate =
  Repo.insert!(%Song{title: "Traitors Gate", album_id: gubernator.id, album: gubernator})

the_great_bear =
  Repo.insert!(%Album{
    title: "The Great Bear",
    date: ~D[2016-01-01],
    cover_url: "the_great_bear.jpg",
    artist_id: andrew_howes.id,
    category_id: rock.id
  })

big_drop =
  Repo.insert!(%Song{title: "Big Drop", album_id: the_great_bear.id, album: the_great_bear})

four_am =
  Repo.insert!(%Song{title: "Four AM", album_id: the_great_bear.id, album: the_great_bear})

waiting =
  Repo.insert!(%Song{title: "Waiting", album_id: the_great_bear.id, album: the_great_bear})

# ========================

# YELLOW CHAIR

yellow_chair = Repo.insert!(%Artist{name: "Yellow Chair", photo_url: "yellow_chair.jpg"})

barcelona =
  Repo.insert!(%Album{
    title: "Barcelona",
    date: ~D[2016-01-01],
    cover_url: "barcelona.jpg",
    artist_id: yellow_chair.id,
    category_id: rock.id
  })

via_laietana =
  Repo.insert!(%Song{title: "Via Laietana", album_id: barcelona.id, album: barcelona})

passeig_de_gracia =
  Repo.insert!(%Song{title: "Passeig de Gracia", album_id: barcelona.id, album: barcelona})

itaca = Repo.insert!(%Song{title: "Itaca", album_id: barcelona.id, album: barcelona})

everything_zen =
  Repo.insert!(%Song{title: "Everything Zen", album_id: barcelona.id, album: barcelona})

meng_jia =
  Repo.insert!(%Album{
    title: "Meng Jia",
    date: ~D[2016-01-01],
    cover_url: "meng_jia.jpg",
    artist_id: yellow_chair.id,
    category_id: rock.id
  })

malvinas_go_go =
  Repo.insert!(%Song{title: "Malvinas Go Go", album_id: meng_jia.id, album: meng_jia})

coronation_pope_francis =
  Repo.insert!(%Song{title: "Coronation Pope Francis", album_id: meng_jia.id, album: meng_jia})

# ========================

# WAYLON THORNTON

waylon_thornton = Repo.insert!(%Artist{name: "Waylon Thornton", photo_url: "waylon_thornton.jpg"})

mystery_club =
  Repo.insert!(%Album{
    title: "Mystery Club",
    date: ~D[2016-01-01],
    cover_url: "mystery_club.jpg",
    artist_id: waylon_thornton.id,
    category_id: rock.id
  })

wobbly_way =
  Repo.insert!(%Song{title: "Wobbly Way", album_id: mystery_club.id, album: mystery_club})

very_hazel =
  Repo.insert!(%Song{title: "Very Hazel", album_id: mystery_club.id, album: mystery_club})

favorite_secrets =
  Repo.insert!(%Song{title: "Favorite Secrets", album_id: mystery_club.id, album: mystery_club})

# ========================

# BREAK THE BANS

break_the_bans = Repo.insert!(%Artist{name: "Break the Bans", photo_url: "break_the_bans.jpg"})

covers_besides =
  Repo.insert!(%Album{
    title: "Covers Besides",
    date: ~D[2016-01-01],
    cover_url: "covers_besides.jpg",
    artist_id: break_the_bans.id,
    category_id: rock.id
  })

how_can_i_love_her =
  Repo.insert!(%Song{
    title: "How Can I Love Her",
    album_id: covers_besides.id,
    album: covers_besides
  })

# ========================

# CULLAH

cullah = Repo.insert!(%Artist{name: "Cullah", photo_url: "cullah.jpg"})

be_love_not_fear =
  Repo.insert!(%Album{
    title: "Be Love Not Fear",
    date: ~D[2016-01-01],
    cover_url: "be_love_not_fear.jpg",
    artist_id: cullah.id,
    category_id: rock.id
  })

save_my_soul =
  Repo.insert!(%Song{
    title: "Save My Soul",
    album_id: be_love_not_fear.id,
    album: be_love_not_fear
  })

who_am_i =
  Repo.insert!(%Song{title: "Who Am I", album_id: be_love_not_fear.id, album: be_love_not_fear})

jane_the_ripper =
  Repo.insert!(%Song{
    title: "Jane the Ripper",
    album_id: be_love_not_fear.id,
    album: be_love_not_fear
  })

trinity =
  Repo.insert!(%Album{
    title: "Trinity",
    date: ~D[2016-01-01],
    cover_url: "trinity.jpg",
    artist_id: cullah.id,
    category_id: rock.id
  })

freed_from_greed =
  Repo.insert!(%Song{
    title: "Freed From Greed",
    album_id: trinity.id,
    album: trinity
  })

aisling = Repo.insert!(%Song{title: "Aisling", album_id: trinity.id, album: trinity})

# ========================

# HANDMADE MOMENTS

handmade_moments =
  Repo.insert!(%Artist{name: "Handmade Moments", photo_url: "handmade_moments.jpg"})

paw_paw_tree =
  Repo.insert!(%Album{
    title: "Paw Paw Tree",
    date: ~D[2016-01-01],
    cover_url: "paw_paw_tree.jpg",
    artist_id: handmade_moments.id,
    category_id: rock.id
  })

junkie = Repo.insert!(%Song{title: "Junkie", album_id: paw_paw_tree.id, album: paw_paw_tree})

fighting_a_mountain =
  Repo.insert!(%Song{title: "Fighting a Mountain", album_id: paw_paw_tree.id, album: paw_paw_tree})

wanderin_eyes =
  Repo.insert!(%Song{title: "Wanderin' Eyes", album_id: paw_paw_tree.id, album: paw_paw_tree})

human_hands =
  Repo.insert!(%Song{title: "Human Hands", album_id: paw_paw_tree.id, album: paw_paw_tree})

coffee_chocolate_earth =
  Repo.insert!(%Song{
    title: "Coffee Chocolate Earth",
    album_id: paw_paw_tree.id,
    album: paw_paw_tree
  })

# ========================

# KING IMAGINE

king_imagine = Repo.insert!(%Artist{name: "King Imagine", photo_url: "king_imagine.jpg"})

inside =
  Repo.insert!(%Album{
    title: "Inside",
    date: ~D[2016-01-01],
    cover_url: "inside.jpg",
    artist_id: king_imagine.id,
    category_id: rock.id
  })

ivy = Repo.insert!(%Song{title: "Ivy", album_id: inside.id, album: inside})
escape = Repo.insert!(%Song{title: "Escape", album_id: inside.id, album: inside})

# ========================

# ========================
# USERS
# ========================

%{password_hash: password_hash} = Pbkdf2.add_hash("12345678")

freddie_mercury =
  Repo.insert!(%User{
    name: "Freddie Mercury",
    email: "freddie@mercury.com",
    password_hash: password_hash
  })

Repo.insert!(%Favorite{
  albums: [trinity],
  user_id: freddie_mercury.id,
  favoritable_type: "Album"
})

Repo.insert!(%Favorite{
  albums: [paw_paw_tree],
  user_id: freddie_mercury.id,
  favoritable_type: "Album"
})

Repo.insert!(%Favorite{
  songs: [everything_zen],
  user_id: freddie_mercury.id,
  favoritable_type: "Song"
})

Repo.insert!(%Favorite{
  albums: [gubernator],
  user_id: freddie_mercury.id,
  favoritable_type: "Album"
})

Repo.insert!(%RecentlyPlayed{
  user_id: freddie_mercury.id,
  albums: [inside]
})

Repo.insert!(%RecentlyPlayed{
  user_id: freddie_mercury.id,
  albums: [trinity]
})

Repo.insert!(%RecentlyPlayed{
  user_id: freddie_mercury.id,
  albums: [gubernator]
})

Repo.insert!(%RecentlyPlayed{
  user_id: freddie_mercury.id,
  albums: [the_great_bear]
})

diana_ross =
  Repo.insert!(%User{
    name: "Diana Ross",
    email: "diana@ross.com",
    password_hash: password_hash
  })

Repo.insert!(%Favorite{
  albums: [trinity],
  user_id: diana_ross.id,
  favoritable_type: "Album"
})

Repo.insert!(%RecentlyPlayed{
  user_id: diana_ross.id,
  albums: [the_great_bear]
})

Repo.insert!(%RecentlyPlayed{
  user_id: diana_ross.id,
  albums: [paw_paw_tree]
})

Repo.insert!(%RecentlyPlayed{
  user_id: diana_ross.id,
  albums: [gubernator]
})

michael_jackson =
  Repo.insert!(%User{
    name: "Michael Jackson",
    email: "michael@jackson.com",
    password_hash: password_hash
  })

Repo.insert!(%Favorite{
  albums: [trinity],
  user_id: michael_jackson.id,
  favoritable_type: "Album"
})

Repo.insert!(%Favorite{
  albums: [paw_paw_tree],
  user_id: michael_jackson.id,
  favoritable_type: "Album"
})

celine_dion =
  Repo.insert!(%User{name: "Celine Dion", email: "celine@dion.com", password_hash: password_hash})

Repo.insert!(%Favorite{
  albums: [trinity],
  user_id: celine_dion.id,
  favoritable_type: "Album"
})

Repo.insert!(%Favorite{
  songs: [everything_zen],
  user_id: celine_dion.id,
  favoritable_type: "Song"
})
