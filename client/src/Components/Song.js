import {useState, useEffect} from 'react';
import { BrowserRouter, Route, Link, Switch } from "react-router-dom";
import axios from 'axios';
import './muplay.css';
import Playlist from './Playlist';
import ReactPlayer from 'react-player/youtube'

let mainURL = 'http://localhost:3001'  

function Song(props){

    const [song, setSong] = useState(null)
    const [youtubeId, setYoutubeId] = useState(null) 
    const [songsList, setSongsList] = useState(null)
    const [funcTitle, SetfuncTitle] = useState("song list")
    const [itemID, setItemId] = useState(null)

    const axiosAll = () =>{
        getSong();
        getSongsList();
     
    };
    useEffect(()=>axiosAll(),[])

    function youtube_parser(url){
        var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
        var match = url.match(regExp);
        return (match&&match[7].length==11)? match[7] : false
   }

    const getSong = () =>{
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

    const getSongsList = () =>{
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
                 <div id="youtube">
                 <ReactPlayer 
                 width="560px" 
                 height="315px"
                 
                 url={`https://www.youtube.com/embed/${youtubeId}`} />
             </div>
                 }

                 <h3>{funcTitle}</h3><br></br>
                 {songsList && <div> 
                     
                 <div id='grid'>
                 {songsList.map((song,i)=>{
                         return(
                 <Link onClick={axiosAll} to={`/Song/${song.id || song.song_id }/${props.match.params.func}/${props.match.params.funcId}`}>
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

         </div>}       
         
         </>)

        };

export default Song;
