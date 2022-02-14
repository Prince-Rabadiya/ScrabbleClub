## Description
A scrabble club requires a system to store members’ information and provide leader
boards to show their top performing players. For members we would want to store
information such as the date they joined the club and their contact details.
All recorded scrabble games are head to head matches between 2 players, the
player with the highest score at the end of the game wins.

This README would normally document whatever steps are necessary to get the
application up and running.

## Requirements

* Ruby 2.6.6
* Rails 6.1.4

## Installation

```
git clone https://github.com/Prince-Rabadiya/ScrabbleClub.git
```
```
bundle
```
```
rails db:create db:migrate db:seed
```
Go ahead and start 
```
rails server
```
## Database Schema

* games table for storing game data

```sql
create_table "games", force: :cascade do |t|
  t.string "name"
  t.text "description"
  t.datetime "start_at"
  t.datetime "end_at"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
end
```

* players table for storing player data

```sql
create_table "players", force: :cascade do |t|
  t.string "name"
  t.string "age"
  t.date "joining_date"
  t.string "contact_number"
  t.string "email"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
end
```
* participations table for storing player participation data in perticular game

```sql
create_table "participations", force: :cascade do |t|
  t.integer "game_id", null: false
  t.integer "player_id", null: false
  t.integer "score"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.index ["game_id"], name: "index_participations_on_game_id"
  t.index ["player_id"], name: "index_participations_on_player_id"
end
```
