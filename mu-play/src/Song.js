import {useState, useEffect} from 'react';
import { BrowserRouter, Route, Link, Switch } from "react-router-dom";
import axios from 'axios';
import './muplay.css';
import Playlist from './Playlist';


let mainURL = 'http://localhost:3001'  

function Song(props){


    const [song, setSong] = useState(null)
    const [youtubeId, setYoutubeId] = useState(null) 
    const [songsList, setSongsList] = useState(null)
    const [funcTitle, SetfuncTitle] = useState("song list")
    const [itemID, setItemId] = useState(null)

    
    const axiosAll = () =>{
        Song();
        SongsList();
     
    };
    useEffect(()=>axiosAll(),[])

    function youtube_parser(url){
        var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
        var match = url.match(regExp);
        return (match&&match[7].length==11)? match[7] : false
   }

    const Song = () =>{
        axios.get(`${mainURL}/songs/${props.match.params.id}`)
    .then(function (response) {
        console.log(youtubeId)
        setSong(response.data[0])
        setYoutubeId(youtube_parser(response.data[0].youtube_url));
    
    })
    .catch(function (error) {
    console.log(error);
    })
    }
    const Playlist = () =>{
        axios.get(`${mainURL}/playlists/${props.match.params.funcId}`)
        .then(function (response) {
      
            setSongsList(response.data)
            setItemId(songsList[0].playlist_id)
            SetfuncTitle(`all songs of "${response.data[1].playlist_name}" playlist`)
               console.log(songsList)
        })
        .catch(function (error) {
        alert(error);
        }) 
    };


    
    const SongsList = () =>{
        axios.get(`${mainURL}/songs`)
        .then(function (response) {
            
            let current = song
            let songArr = [...response.data] 
            
            
            switch(props.match.params.func) {
                case 'artist':
                   
                    setSongsList(songArr.filter(s =>{
                        return (s.artist_id == props.match.params.funcId)
                    }))
                    SetfuncTitle(`all songs of ${current.artist_name}`)
                    setItemId(song.id)
                  break;
                  

                case 'album':
                    
                    setSongsList(songArr.filter(s2 =>{
                        return (s2.album_id == props.match.params.funcId)
                    }))
                    SetfuncTitle(`all songs from ${current.album_name}`)
                    setItemId(song.id)
                  break;
                case 'playlist':
                    
                    Playlist();
                  break;
                default:
                    break;
              }
        })
        .catch(function (error) {
        console.log(error);
        })

    }
    
    
    

    
    return(<>
    

 {song &&

 <div id="main">

 <h2>{song.song_name}</h2>
 
            
            {youtubeId && 
            <iframe
            id="youtube"
            title={`${song.song_name}`} 
            width="560" 
            height="315" 
            src={`https://www.youtube.com/embed/${youtubeId}`} 
            frameborder="0" allow="accelerometer; 
            autoplay; clipboard-write; 
            encrypted-media; gyroscope; 
            picture-in-picture" 
            allowfullscreen>
            </iframe>}
            <h3>{funcTitle}</h3><br></br>
            {songsList && <div> 
                
            <div id='grid'>
            {songsList.map((song,i)=>{
                    return(
            <Link to={`/Song/${song.id}/${props.match.params.func}/${props.match.params.funcId}`}>
                <div key={i} id={'gridbox'}>
                    <img onClick={axiosAll} id='albumImg' src={song.cover_img_url} alt={`By ${song.artist_name}(${song.album_name}, ${song.release_date})`}/>
                        <h4 id='boxText'>{song.song_name}</h4>
                    </div>
            </Link>
                )

            })}
            </div>
            </div>
            }

            </div>}


    
    
    </>)

};


export default Song;