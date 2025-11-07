
// Experiment 10 — CRUD Operations in MongoDB
// Student: Ayush Kohli (UID: 23BCS11238)

// 1. Show all databases
show dbs;

// 2. Create or switch to database
use db_ayush;

// 3. Verify current database
db;

// 4. Create a collection
db.createCollection("movies");

// 5. Insert Operations
db.movies.insertOne({
  title: "Inception",
  director: "Christopher Nolan",
  year: 2010,
  rating: 8.8,
  genre: "Sci-Fi",
  features: ["Mind-bending", "Action"],
  added_by: "Shivanshu"
});

db.movies.insertMany([
  {
    title: "Interstellar",
    director: "Christopher Nolan",
    year: 2014,
    rating: 8.6,
    genre: "Sci-Fi",
    features: ["Space", "Drama"],
    added_by: "Shivanshu"
  },
  {
    title: "Avatar",
    director: "James Cameron",
    year: 2009,
    rating: 7.8,
    genre: "Adventure",
    features: ["3D", "Action"],
    added_by: "Shivanshu"
  },
  {
    title: "The Dark Knight",
    director: "Christopher Nolan",
    year: 2008,
    rating: 9.0,
    genre: "Action",
    features: ["Batman", "Crime"],
    added_by: "Shivanshu"
  }
]);

// 6. Show all collections
show collections;

// 7. Read Operations
db.movies.find().pretty();
db.movies.findOne();
db.movies.find({}, { title: 1, year: 1, _id: 0 });
db.movies.find({ genre: "Action" });
db.movies.find({ "details.language": "English" });

// 8. Update Operations
db.movies.updateOne(
  { title: "Avatar" },
  { $set: { rating: 8.1, genre: "Sci-Fi Adventure" } }
);

db.movies.updateOne(
  { title: "Inception" },
  { $push: { features: "Thriller" } }
);

db.movies.updateOne(
  { title: "Inception" },
  { $pull: { features: "Action" } }
);

db.movies.updateMany(
  { director: "Christopher Nolan" },
  { $set: { language: "English" } }
);

db.movies.updateMany({}, { $unset: { added_by: "" } });
db.movies.updateMany({}, { $set: { color: "Full HD" } });

db.movies.updateOne(
  { title: "Tenet" },
  {
    $set: { director: "Christopher Nolan", year: 2020, rating: 7.5 },
  },
  { upsert: true }
);

// 9. Delete Operations
db.movies.deleteOne({ title: "Avatar" });
db.movies.deleteMany({ director: "Christopher Nolan" });
// db.movies.deleteMany({}); // Deletes all documents

// 10. Aggregation (Grouping)
db.movies.aggregate([
  { $group: { _id: "$director", total_movies: { $sum: 1 } } }
]);

db.movies.aggregate([
  { $group: { _id: "$genre", total_movies: { $sum: 1 } } }
]);

// 11. Drop collection
// db.movies.drop();

// 12. Drop database
// db.dropDatabase();
