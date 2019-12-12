const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find(){
    return db('schemes');
}

function findById(id){
    return db('schemes')
        .where({id})
        .first();
}

function findSteps(id){
    return db('steps as s')
        .select('s.id','sc.scheme_name', 's.step_number','s.instructions')
        .join('schemes as sc','sc.id','s.scheme_id')
        .where('scheme_id', id)
        .orderBy('s.step_number')
}

function add(scheme){
    return db('schemes')
        .insert(scheme,'id')
        .then(ids => {
            const [id] = ids;
            return findById(id)
        });
}

function addStep(){

}

function update(changes, id){
    return db("schemes")
    .update("scheme_name", changes.scheme_name)
    .where({ id })
    .then(count => {
        return findById(id);
    });
}

function remove(id) {  
    return db("schemes")
    .where({ id })
    .del()
}