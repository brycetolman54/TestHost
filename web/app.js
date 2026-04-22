async function ping() {
    const res = await fetch("test-host-roan.vercel.app/api/hello");
    const data = await res.json();
    document.getElementById("out").innerText = data.message;
}
