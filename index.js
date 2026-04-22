import express from 'express';

const app = express();

app.get('/', (req, res) => {
    res.send('Hello buddy bye');
});

const port = 3000;

app.listen(port, () => {
    console.log(`Server is on http://localhost:${port}`);
});
