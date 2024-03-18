const mongoose = require('mongoose');
mongoose.connect('mongodb://admin:okitui75@ac-nqltoof-shard-00-00.9fq1ade.mongodb.net:27017,ac-nqltoof-shard-00-01.9fq1ade.mongodb.net:27017,ac-nqltoof-shard-00-02.9fq1ade.mongodb.net:27017/test?ssl=true&replicaSet=atlas-11ne0q-shard-0&authSource=admin&retryWrites=true&w=majority&appName=Cluster0')
.then(() => {
console.log('connected');
})
.catch((error) =>{
console.log('unable to connect', error);
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