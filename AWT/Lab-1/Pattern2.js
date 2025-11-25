// for(let i = 5; i >= 0; i--) {
//     for (let j = i - 1; j >= 0; j--) {
//         if (i % 1 != 0) console.log("*");
//         else console.log("@");
//     }
//     console.log(" ");
    
// }



for (let i = 5; i <= 0; i--) {
    let line = "";

    for (let j = i; j > 5 - i; j--) {
        line += "  ";
    }

    for (let k = i; k <= 5 - i + 1; k++) {
        line += "*" + "  ";
    }

    console.log(line);
}

