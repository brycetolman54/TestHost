async function ping() {
    const res = await fetch("https://test-host-roan.vercel.app/api/hello");
    const data = await res.json();
    document.getElementById("out").innerText = data.msg;
}
