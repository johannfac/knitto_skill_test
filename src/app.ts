import express, { Express } from "express";

import { initDB } from "./db/init";

const app: Express = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.get("/init", initDB);

app.listen(port, () => {
  console.log(`App running at http://localhost/${port}`)
});
