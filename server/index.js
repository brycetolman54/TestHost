import http from "http";

const port = Number(
  process.argv.length > 2 ? process.argv[2] : process.env.PORT || 3000,
);

function handler(req, res) {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello");
}

const server = http.createServer(handler);

server.listen(port, () => {
  console.log(`Server is listening on port http://localhost:${port}`);
});
