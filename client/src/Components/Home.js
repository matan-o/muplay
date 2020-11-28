import {useState, useEffect} from 'react';
import {Link} from "react-router-dom";

import axios from 'axios';
import './muplay.css';


let mainURL = 'http://localhost:3001'  


function Home(){

    const [songs, setSongs] = useState()
    const [albums, setAlbums] = useState()
    const [artists, setArtists] = useState()
    const [playlists, setPlaylists] = useState()
    
    const axiosAll = () =>{
        topSongs()
        topAlbums()
        topArtists()
        topPlaylists()

    };
    useEffect(()=>axiosAll(),[])

    const topSongs = ()=>{
        axios.get(`${mainURL}/top20_songs`)
    .then(function (response) {
    setSongs(response.data);
    })
    .catch(function (error) {
    console.log(error);
    })
    } ;

    const topAlbums = () =>{
        axios.get(`${mainURL}/top20_albums`)
    .then(function (response) {
    setAlbums(response.data);
    })
    .catch(function (error) {
    console.log(error);
    })
    };

    const topArtists = () =>{
        axios.get(`${mainURL}/top20_artists`)
    .then(function (response) {
    setArtists(response.data);
    })
    .catch(function (error) {
    console.log(error);
    })
    };
    
    const topPlaylists = () =>{
        axios.get(`${mainURL}/top20_playlists`)
    .then(function (response) {
    setPlaylists(response.data);
    })
    .catch(function (error) {
    console.log(error);
    })
    };
    

    return(
    <div id='main'>
    
    
    
    {songs && <div> 
    <h2 >Top 20 songs</h2>
    <div id='grid'>
    {songs.map((song,i)=>{
        return(
            <Link to={`/Song/${song.id}/artist/${song.artist_id}`}>
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={song.cover_img_url} alt={`By ${song.artist_name}(${song.album_name}, ${song.release_date})`}/>
            <h4 id='boxText'>{song.song_name}</h4>
            </div>
            </Link>
        )

    })}
    </div>
    </div>
    }
    
    {albums && <div> 
    <h2 >Top albums</h2>
    <div id='grid'>
    {albums.map((album,i)=>{
        return(
            <Link to={`/album/${album.id}`}>   
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={album.cover_img_url} alt={`By ${album.artist_name}, ${album.release_date})`}/>
            <h4 id='boxText'>{album.album_name}</h4>
            </div>
            </Link>
        )

    })}
    </div>
    </div>
    }
    
    {artists && <div> 
    <h2 >Top artists</h2>
    <div id='grid'>
    {artists.map((artist,i)=>{
        return(
            <Link to={`/artist/${artist.artist_id}`}>
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={artist.artist_img_url} alt={artist.artist_name}/>
            <h4 id='boxText'>{artist.artist_name}</h4>
            </div>
            </Link>
        )

    })}
    </div>
    </div>
    }
    
    
    {playlists && <div> 
    <h2 >Top playlists</h2>
    <div id='grid'>
    {playlists.map((playlist,i)=>{
        return(
            <Link to={`/playlist/${playlist.playlist_id}`}>   
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={albums[Math.floor(Math.random()*7)].cover_img_url} alt={`${playlist.playlist_name}`}/>
            <h4 id='boxText'>{playlist.playlist_name}</h4>
            </div>
            </Link>
        )

    })}
    </div>
    </div>
    }
    
    </div>)

};


export default Home;