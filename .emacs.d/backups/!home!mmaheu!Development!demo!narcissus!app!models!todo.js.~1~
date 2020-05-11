var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var todoSchema = new mongoose.Schema({
	created_by: { type: Schema.ObjectId, ref: 'User' },
	text: String
});

var Todo = mongoose.model('Todo', todoSchema);

function getTodos(res){
	Todo.find(function(err, todos) {

			// if there is an error retrieving, send the error. nothing after res.send(err) will execute
			if (err)
				res.send(err)

			res.json(todos); // return all todos in JSON format
		});
};

module.exports = function(app) {

// api ---------------------------------------------------------------------
// get all todos
	app.get('/api/todos', function(req, res) {

		// use mongoose to get all todos in the database
		getTodos(res);
	});

//Get all Todos based on User
	app.get('/api/:userId', function(req, res) {
	mongoose.model('Todo').find({user: req.params.userId}, function(err, todos) {
		mongoose.model('Todo').populate(todos, {path: 'user'}, function(err, todos) {
		res.send(todos);
		});
	});
	});

// create todo and send back all todos after creation
	app.post('/api/todos', function(req, res) {

		// create a todo, information comes from AJAX request from Angular
		Todo.create({
			text : req.body.text,
			done : false
		}, function(err, todo) {
			if (err)
				res.send(err);

			// get and return all the todos after you create another
			getTodos(res);
		});
	});

// delete a todo
	app.delete('/api/todos/:todo_id', function(req, res) {
		Todo.remove({
			_id : req.params.todo_id
		}, function(err, todo) {
			if (err)
				res.send(err);

			getTodos(res);
		});
	});

module.exports = mongoose.model('Todo', todoSchema);
}
