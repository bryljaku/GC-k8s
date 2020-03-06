import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <Link to="/">I was deployed on GC</Link>
          <Link to="/otherpage">Strong use of Kubernetes</Link>
        </header>
          <div>
            <Route exact path="/" component={Fib}/>
            <Route path="/otherpage" component={OtherPage}/>
          </div>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
      </div>
    </Router>
  );
}

export default App;
