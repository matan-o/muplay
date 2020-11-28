import {useState} from 'react';
import { BrowserRouter, Route, Link, Switch } from "react-router-dom";

import './muplay.css';

import Playlist from './Playlist';
import Artist from './Artist';
import Album from './Album';
import Song from './Song';
import Home from './Home';

function App() {
 

  return (
    <div id='main'>
      <h1> muPlay</h1>
      
     
      <BrowserRouter>
      
            
            <div id='page'>
        <Switch>
         
          <Route exact path="/" component={Home}/>
          <Route path="/playlist/:id" component={Playlist}/>
          <Route path="/artist/:id" component={Artist}/>
          <Route path="/album/:id" component={Album}/>
          <Route path="/song/:id/:func/:funcId" component={Song}/>

     
        </Switch> 
      </div>
      
    </BrowserRouter>
      
   
    </div>
  );
}

export default App;
