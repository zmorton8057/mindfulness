import React from 'react';
import logo from './logo.svg';
import './App.css';

let emotion=[];

$.get('http://localhost:3000/api/emotions/getAllPrimary')
.then((data)=>{
  emotion=data;
})

function App() {
  return (
    
    <div>
      emotion.map((item,index)=>{
        <button>{item.primary_emotion}</button>
      })
    </div>
  );
}

export default App;
