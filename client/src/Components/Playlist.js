import {useState, useEffect} from 'react';
import {Link} from "react-router-dom";
import axios from 'axios';
import './muplay.css';

let mainURL = 'http://localhost:3001'  

function Playlist(props){
    
    const [songs, setSongs] = useState(null)
    
    const axiosAll = () =>{         
        getSongs()
    };

    useEffect(()=>axiosAll(),[])

    const getSongs = () => {
    axios.get(`${mainURL}/playlists/${props.match.params.id}`)
    .then(function (response) {
  
        setSongs(response.data)
           console.log(songs)
    })
    .catch(function (error) {
    console.log(error);
    })
    }

    return(<>
<div key='manu' id='manu'> 
      <Link to="/" > Home   </Link>        
            </div>

    {songs &&
        <div id='main'>
            <br></br>
            <h1>{`"${songs[0].playlist_name}"`}</h1>
            <img id="artistPic" alt={songs.album_name} src={songs[Math.floor(Math.random()*7)].cover_img_url}/>
    <div id='grid'>
    {songs.map((song,i)=>{
        return(
            <Link to={`/Song/${song.song_id}/playlist/${song.playlist_id}`}>
        <div key={i} id={'gridbox'}>
        <img id='albumImg' src={song.cover_img_url} alt={`By ${song.artist_name}(${song.album_name}, ${song.release_date})`}/>
            <h4 id='boxText'>{song.song_name}</h4>
            </div>
            </Link>
        )

    })}
    </div></div>}
    </>)

};

export default Playlist;
