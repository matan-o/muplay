import {useState, useEffect} from 'react';
import {Link} from "react-router-dom";
import axios from 'axios';
import './muplay.css';
let mainURL = 'http://localhost:3001'  

function Album(props){

    const [album, setAlbum] = useState(null)
    const [songs, setSongs] = useState(null)
    
    const axiosAll = () =>{         
        getAlbums()
        getSongs()
    };

    useEffect(()=>axiosAll(),[])

    const getAlbums = () => {
   
    axios.get(`${mainURL}/albums/${props.match.params.id}`)
    .then(function (response) {
        
        setAlbum(response.data[0])
           
    })
    .catch(function (error) {
    console.log(error);
    })
    }

    const getSongs = () => {
   
    axios.get(`${mainURL}/songs`)
    .then(function (response) {
        let songsArr = (response.data).filter(s=>{
             return(s.album_id == props.match.params.id)
        })
        setSongs(songsArr)
           
    })
    .catch(function (error) {
    console.log(error);
    })
    }

    return(<>
    <div key='manu' id='manu'> 
      <Link to="/" > Home   </Link>        
            </div>
    <div id='main'>
      
    {album && <div>
    <h2>{album.album_name}(by {album.artist_name}, {album.release_date})</h2>
        <img id="artistPic" alt={album.album_name} src={album.cover_img_url}/>
        </div>}
        {songs && <div> 
            <div id='grid'>
            {songs.map((song,i)=>{
                return(
                    <Link to={`/Song/${song.id}/album/${song.album_id}`}>
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
      
    </div></>)

};

export default Album;
