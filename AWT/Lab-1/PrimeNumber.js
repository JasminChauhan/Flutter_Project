
function primeNumber() {
    const n = 5;
    for (let i = 2;i < n/2; i++) {
        if (n % i == 0) return false;
        else return true;
    }
}
list = "";
for (let i = 0; i < 5; i++) {
    if (primeNumber(i)) list = i + ","; 
    
}
primeNumber()
console.log(list);
