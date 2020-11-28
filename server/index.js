
const express = require('express');
const mysql = require('mysql');
var cors = require('cors')



const app = express();
app.use(express.json());
app.use(cors())


app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.header("Access-Control-Allow-Headers", "x-access-token, Origin, X-Requested-With, Content-Type, Accept");
    next();
  });



let mySQLcon = mysql.createConnection({
    host:'localhost',
    user:'root',
    password: 'matan321',
    database: 'spotify',
    multipleStatements: true
});

mySQLcon.connect( err=>{
    if(err){
        throw err;
    }
    console.log('connected!')
});


app.get('/songs_table', (req, res) =>{
    mySQLcon.query(`SELECT * FROM songs`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/songs', (req, res) =>{
    mySQLcon.query(
    `SELECT songs.id, songs.song_name, songs.artist_id, songs.album_id, songs.youtube_url, 
    songs.lyrics_url, songs.release_date, songs.Plays,
    albums.id as album_id, albums.album_name, albums.cover_img_url, albums.release_date
    FROM songs, albums
    WHere songs.album_id = albums.id;
   `, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/songs/:id', (req, res) =>{
    mySQLcon.query(
        
    `SELECT *
    FROM songs 
    JOIN artists ON  songs.artist_id = artists.id
    JOIN albums ON albums.id = songs.album_id
    WHERE songs.id = ${req.params.id}`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/artists/:id', (req, res) =>{
    mySQLcon.query(`SELECT *
    FROM artists 
    WHERE artists.id = ${req.params.id}`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/playlists/:id', (req, res) =>{
    mySQLcon.query(`SELECT p.playlist_name, ps.playlist_id, ps.song_id, s.song_name, ar.artist_name, al.album_name, al.cover_img_url 
    FROM playlist_songs ps
    JOIN playlists p ON ps.playlist_id = p.id
    JOIN songs s ON ps.song_id = s.id
    JOIN artists ar ON ar.id = s.artist_id
    JOIN albums al on al.artist_id = s.artist_id
    where p.id = ${req.params.id};`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/albums/:id', (req, res) =>{
    mySQLcon.query(`SELECT *
    FROM albums 
    JOIN artists  ON artists.id = albums.artist_id 
    WHERE albums.id = ${req.params.id}`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/top20_songs', (req, res) =>{
    mySQLcon.query(`SELECT songs.id, songs.song_name, songs.artist_id, songs.album_id, songs.youtube_url, 
   songs.lyrics_url, songs.release_date, songs.Plays,
   albums.id as album_id, albums.album_name, albums.cover_img_url, albums.release_date,
   artists.artist_name
FROM songs, albums, artists 
WHere songs.album_id = albums.id AND artists.id = songs.artist_id
ORDER BY songs.plays DESC 
LIMIT 20;`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/top20_artists', (req, res) =>{
    mySQLcon.query(`SELECT s.artist_id, SUM(s.plays) AS total_plays, a.artist_name, a.artist_img_url
    FROM songs s  
    JOIN artists a
    ON a.id = s.artist_id 
    GROUP BY artist_id 
    -- ORDER BY SUM(s.plays);
    ORDER BY SUM(s.plays) DESC
    LIMIT 20;`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/top20_albums', (req, res) =>{
    mySQLcon.query(`SELECT albums.id, albums.album_name, albums.cover_img_url, albums.release_date, albums.artist_id,
		SUM(songs.plays) as plays,
        artists.artist_name
        
        FROM albums, songs, artists
        WHERE albums.id = songs.album_id AND artists.id = albums.artist_id
        GROUP BY songs.album_id
        ORDER BY SUM(songs.plays) DESC
        LIMIT 20;
        `, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.get('/top20_playlists', (req, res) =>{
    mySQLcon.query(`SELECT ps.playlist_id, SUM(s.plays) AS total_plays, p.playlist_name
    FROM playlist_songs ps
    JOIN songs s, playlists p
    WHERE ps.song_id = s.id AND p.id = ps.playlist_id
    GROUP BY p.id
    ORDER BY SUM(s.plays) DESC
    LIMIT 20;`, (error, results, fields)=>{
        
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.post('/songs',(req,res)=>{
    mySQLcon.query(`INSERT INTO songs SET ?`,[req.body], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results[0]); 
    });
});


app.post('/albums',(req,res)=>{
    mySQLcon.query(`INSERT INTO albums SET ?`,[req.body], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results[0]); 
    });
});

app.post('/playlists',(req,res)=>{
    mySQLcon.query(`INSERT INTO playlists SET ?`,[req.body], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results[0]); 
    });
});

app.post('/artists',(req,res)=>{
    mySQLcon.query(`INSERT INTO artists SET ?`,[req.body], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results[0]); 
    });
});


// --PUT songs req.body---
// {
//     "song_name": "Eternal Wheel",
//     "artist_id": 1,
//     "album_id": 1,
//     "youtube_url": "https://URL",
//     "release_date": 1990,
//     "Plays": 55555
//     }


app.put('/songs/:id',(req,res)=>{
    mySQLcon.query('UPDATE songs SET song_name = ?, artist_id = ?, album_id = ?, youtube_url = ?, release_date = ?, Plays = ? WHERE songs.id = ?;',
    [req.body.song_name, req.body.artist_id, req.body.album_id, req.body.youtube_url, req.body.release_date, req.body.Plays, req.params.id],
    
    (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.put('/artists/:id',(req,res)=>{
    mySQLcon.query('UPDATE artists SET artist_name = ? WHERE id = ?',
    [req.body.artist_name, req.params.id],
    
    (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.put('/playlists/:id',(req,res)=>{
    mySQLcon.query('UPDATE playlists SET playlist_name = ? WHERE id = ?',
    [req.body.playlist_name, req.params.id],
    
    (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

// --PUT albums req.body---
// {
//     "cover_img_url": "URL"
//     "lyrics_url": "URL",
//     }

app.put('/albums/:id',(req,res)=>{
    mySQLcon.query('UPDATE albums SET cover_img_url = ?, lyrics_url = > WHERE id = ?',
    [req.body.cover_img_url, req.body.lyrics_url, req.params.id],
    
    (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.delete('/songs/:id',(req,res)=>{
    mySQLcon.query('DELETE FROM songs WHERE id = ?',
    [req.params.id], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.delete('/albums/:id',(req,res)=>{
    mySQLcon.query('DELETE FROM albums WHERE id = ?',
    [req.params.id], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});

app.delete('/artists/:id',(req,res)=>{
    mySQLcon.query('DELETE FROM artists WHERE id = ?',
    [req.params.id], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});


app.delete('/playlists/:id',(req,res)=>{
    mySQLcon.query('DELETE FROM playlists WHERE id = ?',
    [req.params.id], (error, results, fields) =>{
       
        if(error){
            res.send(error.message);
            throw error;
        }
        res.send(results); 
    });
});


app.listen(3001);

