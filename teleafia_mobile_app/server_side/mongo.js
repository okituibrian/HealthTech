const mongoose = require('mongoose');
mongoose.connect('mongodb+srv://trial:trial@trial.874xgts.mongodb.net/trial?retryWrites=true&w=majority&appName=trial')
.then(() => {
console.log('connected');
})
.catch(() =>{
console.log('error');
})
const newSchema = new mongoose.Schema({
name: {
    type: String,
    required: true
},
email: {
    type: String,
    required: true
},
phone: {
    type: String,
    required: true
},
id: {
    type: String,
    required: true
},
location: {
    type: String,
    required: true
},
password: {
    type: String,
    required: true
},
confirm_password: {
    type: String,
    required: true
},
});
const collection = mongoose.model('collection', newSchema)
module.exports=collection