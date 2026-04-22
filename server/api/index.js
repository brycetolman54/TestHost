import db from "./db.js";

export default function handler(req, res) {
    res.status(200).send(db.message);
}
