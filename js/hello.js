console.log('Google Mirror JS');
console.log('Powered by Yunwu');


const key = "GF3DA";


function verify() {
    if(!document.cookie || !document.cookie.key || document.cookie.key != key) {
        document.write("403Forbidden");
        return;
    }
}


verify();
