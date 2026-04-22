async function ping() {
  const res = await fetch("https://your-backend.vercel.app/api");
  const data = await res.json();
  document.getElementById("out").innerText = data.message;
}
