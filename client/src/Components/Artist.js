import {useState, useEffect} from 'react';
import {Link} from "react-router-dom";
import axios from 'axios';
import './muplay.css';

let mainURL = 'http://localhost:3001'  

function Artist(props){
    
    const [artist, setArtist] = useState(null)
    const [songs, setSongs] = useState(null)
    const [albums, setAlbums] = useState(null)
   
    const axiosAll = () =>{
        getArtist()
        getSongs()
        getAlbums()
    };

    useEffect(()=>axiosAll(),[])
    
    const getArtist = () => {
   
    axios.get(`${mainURL}/artists/${props.match.params.id}`)
    .then(function (response) {
        setArtist(response.data[0]);
    })
    .catch(function (error) {
    console.log(error);
    })
   }

    const getSongs = () => {
   
    axios.get(`${mainURL}/songs`)
    .then(function (response) {
        setSongs(response.data.filter(song =>{
           return (song.artist_id == props.match.params.id)
        }));  
        console.log(songs)      
    })
    .catch(function (error) {
    console.log(error);
    })
   }

    const getAlbums = () => {
   
    axios.get(`${mainURL}/top20_albums`)
    .then(function (response) {
        setAlbums(response.data.filter(album =>{
            return (album.artist_id == props.match.params.id)
         }));
    })
    .catch(function (error) {
    console.log(error);
    })
   }
   
   return(<>
    <div id='main'>

    {artist && 
    <div id = 'artist'>
    <h1>{artist.artist_name}</h1>
    <img id='artistPic' alt={artist.artist_name} src={artist.artist_img_url}></img>

    </div>} 

    {songs && <div> 
    <h3 >songs of {artist.artist_name}</h3><br></br>
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
    <h3 >albums of {artist.artist_name}</h3><br></br>
    <div id='grid'>
    {albums.map((album,i)=>{
        return(
            <Link to={`/album/${album.id}`}>
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={album.cover_img_url} alt={`By ${album.artist_name}(${album.album_name}, ${album.release_date})`}/>
            <h4 id='boxText'>{album.album_name}</h4>
            </div>
            </Link>
        )

    })}
        </div>
            </div>
    }  
                </div>
    
    </>)

};


export default Artist;