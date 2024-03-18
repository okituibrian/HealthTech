
const express = require('express');
const collection = require("./mongo");
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use(bodyParser.json());

app.get("/", cors(), (req, res) => {
  console.log('here');
  res.send('HI');
});

app.post('/register', async (req, res) => {
  const { name, email, phone, id, location, password, confirm_password } = req.body;

  try {
    const user = await collection.findOne({ email: email });
    if (user) {
      return res.json('email already used');
    }

    const newUser = await collection.create({
      name,
      email,
      phone,
      id,
      location,
      password,
      confirm_password,
    });
    console.log('User registered:', newUser);
    res.json({ success: true, message: 'Registration Successful' });
  } catch (error) {
    console.error('Error registering user:', error);
    res.status(500).json({ success: false, message: 'Registration Failed' });
  }
});
app.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await collection.findOne({ email: email });
    if (!user || user.password !== password) {
      return res.status(401).json({ success: false, message: 'Incorrect email or password' });
    }

    res.json({ success: true, message: 'Login Successful', user: user });
  } catch (error) {
    console.error('Error logging in user:', error);
    res.status(500).json({ success: false, message: 'Login Failed' });
  }
});

app.listen(4000, () => {
  console.log('server is running on http://localhost:4000');
});