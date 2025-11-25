function printFactors(n) {
    list = "";
    for (let i = 1; i <= n; i++) {
        if (i % n == 0) list = i + ","; 
    }
    console.log(list);
}

printFactors(10)