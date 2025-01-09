-- Enable Foreign Key Constraints
PRAGMA foreign_keys = ON;

-- Users Table
CREATE TABLE IF NOT EXISTS Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

-- Artists Table
CREATE TABLE IF NOT EXISTS Artists (
    artist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    genre TEXT,
    country TEXT
);

-- Albums Table
CREATE TABLE IF NOT EXISTS Albums (
    album_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    release_year INTEGER,
    artist_id INTEGER NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artists (artist_id) ON DELETE CASCADE
);

-- Tracks Table
CREATE TABLE IF NOT EXISTS Tracks (
    track_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    duration TEXT NOT NULL,
    genre TEXT,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums (album_id) ON DELETE CASCADE
);

-- Playlists Table
CREATE TABLE IF NOT EXISTS Playlists (
    playlist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- PlaylistTracks Table (Many-to-Many relationship between Playlists and Tracks)
CREATE TABLE IF NOT EXISTS PlaylistTracks (
    playlist_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlists (playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks (track_id) ON DELETE CASCADE
);

-- PlayHistory Table (Tracking user plays)
CREATE TABLE IF NOT EXISTS PlayHistory (
    history_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    track_id INTEGER NOT NULL,
    played_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks (track_id) ON DELETE CASCADE
);
