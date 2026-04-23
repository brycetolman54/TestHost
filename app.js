const baseURL = "https://text-host-roan.vercel.app/api/";

async function ping() {
    const res = await fetch(baseURL);
    const data = await res.json();
    document.getElementById("out").innerText = data.msg;
}
