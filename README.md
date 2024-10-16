# 🔊 Spotify 🎶🎼

## 💿 Description
Based on Spotify dataset we are trying to identify the most commercially successful genre , release period and artist. After the elaboration of the business question we came up with the 3 following hypothesis, that will be accepted or rejected, after our analysis:

### 🥁  H1: Genre Popularity
'Pop songs are more popular than songs from other genres.’

### 🎛  H2: Release period
'Songs released after 2010 are, on average, more popular than songs released before 2010.'

### 🎤  H3: Artist Popularity
‘Artists with more songs tend to have a higher average popularity.'

## 🎼 Prerequisites
- Python Project
- SQL Workbench
- Dataset link- https://www.kaggle.com/datasets/joebeachcapital/30000-spotify-songs
- Git Hub link- https://github.com/mirajkarsneha/mini-project-spotify
- Trello link- https://trello.com/invite/b/6705422208d48f4977de79e2/ATTIe61fd4faa19f1581fdb3f3ec7e8267b18EF383D5/spotify-miniproject
- Presentation link - https://docs.google.com/presentation/d/1Zl9op72Bn9ZCgn8UZRXf_eQ-q_IJdZvCPd0bKanRWlk/edit?usp=sharing

## 🎧 Data Cleaning and Wrangling
### 🎙️ Description how dataset is cleaned
- Removed Non-ASCII characters.
- Handling Duplicates, dropped duplicate columns.
- Dropped rows(loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo, danceability, energy, key, mode)which where not use for our analyisis.
- Converted duration_ms row from milli seconds to minutes.
- Renamed row duration_ms' to 'duration'
  
## 🎹 DATABASE CREATION
### 📝 Description how database is created
- Created EER diagram from single table split into diffrent tables.
- Analysed the foreign key and relationship with each table.
- Inserted the data from csv to the database table.
- Wrote SQL quiries to anaylse all the hypothesis.

## 📻 Project Structure
This is a python project has below mentioned files.
- main.ipnyb - This file has the cleaning data code and graphical visuals for all the 3 Hypothesis.
- README.md - Describes what the project is, how it is structured and what changes are applied to get a clean data file.
- DataCreation.sql - How one single is split into 3 diffrent tables.
- Hypothesis.sql - SQL Queries for all the 3 hypothesis.
- DataFiles - Has all the Hypothesis data files in form of csv and also has spotify_songs data file.
