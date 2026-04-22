import express from "express";

const app = express();

app.use(express.json());

app.use(express.static("public"));

app.set('trust proxy', true);

app.get("/", (req, res) => {
  res.send("Hello");
});

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
