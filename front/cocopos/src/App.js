
import React from "react";
import {Routes, Route} from 'react-router-dom'
import './App.css';
import Main from "./page/Main";
import Sale from "./page/Sale";
import ReturnPage from "./page/ReturnPage";
import ItemAdd from "./page/ItemAdd";
import Manage from "./page/Manage";

function App() {
  return (
    <Routes>
        <Route path='/' element ={<Main/>}/>
        <Route path='/item' element={<ItemAdd/>}/>
        <Route path='/sale' element={<Sale/>}/>
        <Route path='/return' element={<ReturnPage/>}/>
        <Route path='/manage' element={<Manage/>}/>
    </Routes>
  );
}

export default App;
