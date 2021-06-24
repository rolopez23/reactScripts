echo $'\e[1;33m'Enter Your App Info Here:$'\e[0m'
read title

echo $'\e[0;32m'writing package.json$'\e[0m'
cat > package.json <<- EOF
{
  "name": "$title",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
   "dependencies": {
    "axios": "^0.21.1",
    "express": "^4.17.1",
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "dotenv": "^10.0.0"
  },
  "devDependencies": {
    "eslint": "^7.28.0",
    "eslint-config-airbnb": "^18.2.1",
    "eslint-plugin-import": "^2.23.4",
    "eslint-plugin-jsx-a11y": "^6.4.1",
    "eslint-plugin-react": "^7.24.0",
    "eslint-plugin-react-hooks": "^4.2.0",
    "@babel/cli": "^7.14.5",
    "@babel/core": "^7.14.6",
    "@babel/preset-env": "^7.14.5",
    "@babel/preset-react": "^7.14.5",
    "babel-loader": "^8.2.2",
    "nodemon": "^2.0.7",
    "webpack": "^5.39.0",
    "webpack-cli": "^4.7.2"
  },
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "nodemon server/index.js",
    "prod": "node server/index.js",
    "react-dev": "webpack ./webpack.dev.config.js",
    "react-prod": "webpack ./webpack.prod.config.js"
  },
  "author": "",
  "license": "ISC"
}
EOF

echo $'\e[0;32m'writing .eslintrc.js$'\e[0m'
cat > .eslintrc.js <<- EOF
module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true,
  },
  extends: [
    'plugin:react/recommended',
    'plugin:jsx-a11y/recommended',
    'airbnb',
  ],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 12,
    sourceType: 'module',
  },
  plugins: [
    'react',
  ],
  rules: {
  },
};
EOF

echo $'\e[0;32m'writing webpack.config.js$'\e[0m'
cat > webpack.dev.config.js <<- "EOF"
const path = require('path');

module.exports = {
  entry: `${__dirname}/client/src/Index.jsx`,
  mode: 'development',
  devtool: 'eval-source-map',
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        loader: "babel-loader"
      }
    ]
  },
  output: {
    filename: 'bundle.js',
    path: `${__dirname}/public`
  }
};
EOF

echo $'\e[0;32m'writing .babelrc$'\e[0m'
cat > .babelrc <<- "EOF"
{ "presets": ["@babel/preset-env", "@babel/preset-react"] }
EOF

echo $'\e[0;32m'writing .gitignore$'\e[0m'
cat > .gitignore <<- "EOF"
node_modules
bundle.js
.
EOF

echo $'\e[0;32m'writing server$'\e[0m'
mkdir server
cat > server/index.js <<- "EOF"
const express = require('express');
const path = require('path');
const app = express();
const port = 3127;

app.use(express.static(path.join(__dirname, '../public')));

app.get('/', (req, res) => {
  res.end();
});

app.listen(port, () => console.log(`Listening at http://localhost:${port}`));
EOF

echo $'\e[0;32m'writing client$'\e[0m'
mkdir client
mkdir client/src
cat > client/src/Index.jsx <<- "EOF"
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App.jsx';

ReactDOM.render(<App />, document.getElementById('app'));
EOF

mkdir client/src/components
cat > client/src/components/App.jsx <<- "EOF"
import React from 'react';
const axios = require('axios');

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  componentDidMount() {
    axios.get('/')
    .then(res => console.log(res))
    .catch(err => console.error(err));
  };

  render() {
    return (
      <div>Ahoy Cap't! App is Running!</div>
    )
  };
}

export default App;
EOF

echo $'\e[0;32m'writing db$'\e[0m'
mkdir db
touch db/index.js

echo $'\e[0;32m'writing test$'\e[0m'
mkdir test
touch test/test.js

echo $'\e[0;32m'writing public$'\e[0m'
mkdir public
cat > public/index.html <<- "EOF"
<!DOCTYPE html>
<html style="font-family: Lato, sans-serif;">
  <head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    <title></title>
  </head>
  <body>
    <div id="app"></div>
    <script src="bundle.js"></script>
  </body>
</html>
EOF

echo $'\e[0;32m'adding README.md$'\e[0m'
cat > README.md <<- "EOF"
Make something cool!
EOF