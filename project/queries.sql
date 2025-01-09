-- Insert Users
INSERT INTO Users (username, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO Users (username, email) VALUES ('Bob', 'bob@example.com');

-- Insert Artists
INSERT INTO Artists (name, genre, country) VALUES ('Taylor Swift', 'Pop', 'USA');
INSERT INTO Artists (name, genre, country) VALUES ('Ed Sheeran', 'Pop', 'UK');

-- Insert Albums
INSERT INTO Albums (title, release_year, artist_id) VALUES ('1989', 2014, 1);
INSERT INTO Albums (title, release_year, artist_id) VALUES ('Divide', 2017, 2);

-- Insert Tracks
INSERT INTO Tracks (title, duration, genre, album_id) VALUES ('Shake It Off', '3:39', 'Pop', 1);
INSERT INTO Tracks (title, duration, genre, album_id) VALUES ('Shape of You', '3:53', 'Pop', 2);

-- Insert Playlists
INSERT INTO Playlists (name, user_id, created_at) VALUES ('Favorites', 1, datetime('now'));
INSERT INTO Playlists (name, user_id, created_at) VALUES ('Workout Mix', 2, datetime('now'));

-- Add Tracks to Playlists
INSERT INTO PlaylistTracks (playlist_id, track_id) VALUES (1, 1);
INSERT INTO PlaylistTracks (playlist_id, track_id) VALUES (1, 2);
INSERT INTO PlaylistTracks (playlist_id, track_id) VALUES (2, 2);

-- Retrieve all tracks in a specific playlist
SELECT p.name AS playlist_name, t.title AS track_title
FROM Playlists p
JOIN PlaylistTracks pt ON p.playlist_id = pt.playlist_id
JOIN Tracks t ON pt.track_id = t.track_id
WHERE p.name = 'Favorites';

-- Find all tracks by a specific artist
SELECT a.name AS artist_name, t.title AS track_title
FROM Artists a
JOIN Albums al ON a.artist_id = al.artist_id
JOIN Tracks t ON al.album_id = t.album_id
WHERE a.name = 'Taylor Swift';

-- Get all playlists created by a user
SELECT u.username, p.name AS playlist_name
FROM Users u
JOIN Playlists p ON u.user_id = p.user_id
WHERE u.username = 'Alice';

-- Insert a new track
INSERT INTO Tracks (title, duration, genre, album_id) VALUES ('All Too Well', '5:29', 'Pop', 1);

-- Update playlist name
UPDATE Playlists SET name = 'Chill Vibes' WHERE playlist_id = 1;

-- Delete a playlist
DELETE FROM Playlists WHERE playlist_id = 2;
